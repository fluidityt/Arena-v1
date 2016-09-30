//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global
import SpriteKit
func notafunc_conventions() {
/*

func purFunc(mat:Void) -> String {
	stuff()
}
;
something = purFunc(d)
;
*/
}


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
			XY.first_y 		 = touch.locationInNode(self).y
			C.first_time = C.time_now
		}
		Hotfix(){}
		return
	}
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
			FirstEntry: do {
				// Initials for temporal naming sanity \\
				Hotfix(){}// all of the below is junk
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
			

			/**
			--1. Update smooth_y_tuple
			--2. Update current Y coordinate to SmoothedY coordinate
			--3. Do acceleration Maths
			--4. create and return proper rotation action
			*/
			func findRotationAction(current_y: CGFloat) -> SKAction {
			
				/// 1: a tuple of 3 CGFloats, for C.y_tuple
				typealias TripleFloat = (String, CGFloat,CGFloat,CGFloat)
				
				/// Update stacks, determine which new Y value to deflate and return
				func setYTuple (globalYs ys: TripleFloat, currentY cur_y: CGFloat) -> TripleFloat {
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
				;
				Global.XnY.y_tuple = setYTuple(globalYs: XY.y_tuple, currentY: current_y)
				;
				
				
				/// 2: Averaged / deflated y value
				let smoothed_y: CGFloat?
				
				typealias SmoothedY = CGFloat
				/**
				... Uses y_tuple and all the above to give us a smoother Y value,-
				-RJ # pix b4 active.. Logic algorythimg */
				func setSmoothedY (yt yt: TripleFloat,
				                   cur_y: CGFloat,
				                   real_jump: CGFloat)	-> SmoothedY
				{
					//FIXME: 
					let ys = yt
					
					/// delta-absolute-value of y2-y1
					let dav = (y3y2: absV((ys.3 - ys.2)),
					           y2y1: absV((ys.2 - ys.1)))
					
					
					checkIfOnlyThreeInputs: do {
						// See last function for values that are carried over or were 0
						
						// Only first input
						if ys.1 == cur_y {
							return ys.1
						}
							
							// Only second input
						else if ys.2 == ys.1 {
							return average([ys.1,ys.2])
						}
					}
					
					smoothFourthInput: do {
						// The acceleration is real:
						if (dav.y3y2 > real_jump) && (dav.y2y1 > real_jump)	{
							return average([ys.1,ys.2,ys.3])
						}
							
							// Slowing down?
						else if (dav.y3y2 > real_jump)	&& (dav.y2y1 < real_jump) {
							return average([ys.2,ys.3])
						}
							
							// Speeding up?
						else if (dav.y3y2 < real_jump)	&&	(dav.y2y1 > real_jump) {
							return average([ys.1,ys.2])
						}
							
							// No accel:
						else if (dav.y3y2 < real_jump)	&&	(dav.y2y1 < real_jump) {
							return average([ys.1,ys.2,ys.3])
						}
							
							// IDK lol... need to add cases for y1 and y3 with y2 being outlier
						else {
							return average([ys.1,ys.2,ys.3])
						}
					}
				}
				;
				XY.y.current	= setSmoothedY(yt: XY.y_tuple, cur_y: current_y, real_jump: 2)
				// dont i need to update my globe?
				;
			
				
				func vs(){
					/*zfindRotationAction( current_angle _current_angle	:CGFloat,
				                                       
				                                       _previous_y			:CGFloat,
				                                       _current_y			:CGFloat,
				                                       
				                                       _previous_time	:NSTimeInterval,
				                                       _current_time		:NSTimeInterval,
				                                       
				                                       ) -> SKAction {
					*/
					/*/// 3:
					let

					smoothed_y: CGFloat?, 					// Our current_y only deflated based on algorythinm
					accelerated_angle: CGFloat?, 					// Needs smoothed_y:
					
					// Needs accelerated_angle:
					next_angle: CGFloat?,
					
					// Needs next_angle; this is our return value:
					fully_calibrated_action: SKAction?
					
					
					
					
					print(smoothed_y)
					*/
				}
				
				typealias FirstPrevCur = (first: CGFloat, previous: CGFloat, current: CGFloat)
					// How fast we moved the cursor
					// findAccel() -> doLogic() -> (how far to move wheel)
				func findAcceleratedAngle(
																	//smoothed Y value from above
																	smoothedY smoothed_y: CGFloat,
				                          // Y values from glboe:
																  yFPC y: FirstPrevCur,
																  // Time values from globe
				                          timeFPC time: FirstPrevCur,
																  // Adjust to increase / decrease overall accel
																  accel_slider: CGFloat
																)
					-> CGFloat
				{
					
					/// Abs change in smoothY - prevY, and change in currentT - prevT; Math variables.
					let delta = (y: absV(smoothed_y - y.previous),
					             t: CGFloat(time.current - time.previous)
					
					/// pixels per second:
					let PPS	= (delta.y / delta.t)
					
					/// How far it spins (speed)
					let radians			= absV(PPS * -0.0025),
					
					// The min/max speed is 100/400 PPS
					let
					min_speed 	:CGFloat = 0.001,
					max_speed 	:CGFloat = 0.4
					
					
					// Return logic based on math above:
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
		}
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

