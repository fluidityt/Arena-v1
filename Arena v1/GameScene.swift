//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global
import SpriteKit


class GameScene: SKScene {
	override func didMoveToView(view: SKView) {
		
		genericInits: do {
			
			Global.SELF = self
			XY.CENTER_SCREEN = CGPoint(x:CGRectGetMidX(SELF!.frame),
			                           y:CGRectGetMidY(SELF!.frame))
		}
		
		initCircles: do {
			
			N.central = Circle()
			Global.SELF.addChild(N.central)
			
			N.central.runAction(SKAction.rotateToAngle(0, duration: 0.5))
			XY.super_angle = N.central.zRotation
		}
		return
	}
	
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
			C.first_drag   = true
		 C.first_y 		 = touch.locationInNode(self).y
			C.first_time = C.time_now
			
		}
		return
	}
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
		FirstEntry: do {
			// Initials for temporal naming sanity \\
			if C.first_drag == true {
				XY.prev_y 			= XY.first_y
				C.time_then 	= C.first_time
				C.first_drag	= false
			}
		}
		
		// Paused (lateral)--no angle now--reset values
		guard (XY.cur_y == XY.prev_y) else {
			
			// TODO: get rid of globalz
			_=Hotfix() {
				printl("paused but didn't release")
				N.central.removeAllActions()
				XY.y1 = 0
				XY.y2 = 0
				XY.y3 = 0
			}
			
			return // From guard
		}
		
		findRotationAction: do {
		
			/**
			... The current Y value of most recent touch location */
			let current_y = touch.locationInNode(self).y
			
			/**
			... a tuple of 3 CGFloats, for C.y_tuple			*/
			typealias TripleFloat = (String, CGFloat,CGFloat,CGFloat)
			
			/**
			...	Update our stacks, so we can determine-
			-which new Y value to deflate and return			*/
			func setNewYTuple (globalYs ys: TripleFloat, currentY cur_y: CGFloat) -> TripleFloat {
				/*
				... TODO: I could smooth the raw input-
				-drop outliers, and smooth the accel */
			
				if ys.1 == 0 {
					return ("new_vals:", cur_y, ys.2, ys.3)		// y1 = current_y
				}
					
				else if ys.2 == 0 {
					return ("new_vals:", cur_y, ys.1, ys.3) 	// y2 = y1; y1 = current_y
				}
					
				else if ys.3 == 0 {
					return ("new_vals:", cur_y, ys.1, ys.2)		// y3 = y2; y2 = y1; y1 = current_y
				}
					
				// FIXME: this is the same as above
				else {
					return ("new_vals:", cur_y, ys.1, ys.2)		// y3 = y2; y2 = y1; y1 = current_y
				}
			}
			
			Global.Controls.y_tuple = setNewYTuple(globalYs: C.y_tuple, currentY: current_y)
			
		
			/// Averaged / deflated y value
			let smoothed_y: CGFloat?
			
			/// Uses y_tuple and all the above to give us a smoother Y value
			typealias NewY = CGFloat
			func setSmoothedY (globalYs ys: TripleFloat,
			                            currentY cur_y: CGFloat,
			                                     real_jump: CGFloat) -> NewY {
				

				// Determines how many pixels count as a real jump (accel), for use in Logic
				printl("using RJ value \(real_jump)")
				let rj = real_jump
				
				// Only first input
				if y1 == current_y {
					return y1
				}
					
					// Only second input
				else if y2 == y1 {
					return average([y1,y2])
				}
				
				// The acceleration is real:
				if		 (absV(y2 - y3) > real_jump)
					&&
					(absV(y1 - y2) > real_jump)	{	return average([y1,y2,y3])}
					
					// Slowing down?
				else if (absV(y2 - y3) > real_jump)
					&&
					(absV(y1 - y2) < real_jump) { return average([y2,y3]) }
					
					// Speeding up?
				else if (absV(y2 - y3) < real_jump)
					&&
					(absV(y1 - y2) > real_jump) { return average([y1,y2]) }
					
					// No accel:
				else if (absV(y2 - y3) < real_jump)
					&&
					(absV(y1 - y2) < real_jump) { return average([y1,y2,y3])}
					
					// IDK lol... need to add cases for y1 and y3 with y2 being outlier
				else {  return average([y1,y2,y3]) }
			}

			
			/// O ya...
		func findRotationAction( current_angle _current_angle	:CGFloat,
		                                	 
		                                	 _previous_y			:CGFloat,
		                                	 _current_y			:CGFloat,
		                                	 
		                                	 _previous_time	:NSTimeInterval,
		                                	 _current_time		:NSTimeInterval,
		                                	 
			) -> SKAction {
			
			// In order, we will define:
			let
			// Our current_y only deflated based on algorythinm
			smoothed_y: CGFloat?,
			
			// Needs smoothed_y:
			accelerated_angle: CGFloat?,
			
			// Needs accelerated_angle:
			next_angle: CGFloat?,
			
			// Needs next_angle; this is our return value:
			fully_calibrated_action: SKAction?
			
			
			
			
			print(smoothed_y)
			
			// How fast we moved the cursor
			// findAccel() -> doLogic() -> (how far to move wheel)
			accelerated_angle = {
				
				// Math variables
				let
				deltaY    	= absV(smoothed_y! - previous_y),
				deltaT			= CGFloat(current_time - previous_time),
				
				// pixels per second:
				PPS	= (deltaY / deltaT),
				
				// How far it spins (speed)
				radians			= absV(PPS * -0.0025),
				
				// The min/max speed is 100/400 PPS
				min_speed 	:CGFloat = 0.001,
				max_speed 	:CGFloat = 0.4,
				
				// Adjust to increase / decrease overall accel
				accel_slider = CGFloat(0.001)
				//printd("rad  : \(CGFloat(radian_spin + accel_slider))n")
				
				
				// Return logic
				Logic: do {
					
					if (radians + accel_slider) > max_speed	{
						return max_speed
					}
						
					else if (radians + accel_slider) < min_speed {
						return min_speed
					}
						
					else {
						return (radians + accel_slider)
					}
				}
			}()
			print(accelerated_angle)
			
			// Next angle
			next_angle = {
				printd("current angle: \(current_angle)")
				// Dragged up (clockwise)
				if (current_y > previous_y) {
					return current_angle + accelerated_angle!
				}
					
					// Dragged down (counterclockwise)
				else {
					return current_angle - accelerated_angle!
				}
				
			}()
			print(next_angle)
			
			
			// Our final calculation:
			fully_calibrated_action = SKAction.rotateToAngle(next_angle!, duration: 0.0)
			print(fully_calibrated_action)
			print("\n")
			
			
			// Update globes for next entry
			wrapUp: do {
				
				//_prevY = current_y
				_curY  = smoothed_y!
				
				_curA  = next_angle!
				
				_timeThen = current_time
			}
			
			// Annnd we're outta here!!
			return fully_calibrated_action!
		}
		/*

		// Enter the massive func!
		printd("going into wheelspin")
		let fully_handled_rotation_action_with_acceleration_and_smoothing
			
			= findRotationAction(
				current_angle:		W.cur_angle,
				previous_y: 			C.prev_y,
				current_y: 				C.cur_y,
				previous_time:	C.time_then,
				current_time: 	C.time_now
		)
		
		
		runFoundAction: do {
			N.central.runAction(fully_handled_rotation_action_with_acceleration_and_smoothing)
		}

			*/
		return // From TM
	}
	
	
	
	override func update(currentTime: CFTimeInterval) {
		
		updateClock: do {
			
			// Clocker...
			_clock_count += 1
			
			// Seconder...
			if _clock_count == 60 {
				
				_clock_count = 0
				_seconds += 1
			}
			
			// Spawner...
			if _seconds == 3 {
				
				enemySpawner()
				_seconds = 0
			}
			
			
			
		}
		
		C.time_now = currentTime
		
		
	}//update
	
	
	
	
}//EoC

func shapeTex(node:SKShapeNode) {
	
	node.fillColor = UIColor.whiteColor()
	node.fillTexture = SKTexture.init(image: UIImage(named: "twistycenter")!)
}

