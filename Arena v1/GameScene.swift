//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global
import SpriteKit

protocol Static {}
// Typealias
func notafunc_conventions() {
/*

func purFunc(mat:Void) -> String {
	stuff()
}
;
something = purFunc(d)
;
	
	DONT I NEED TO FIGURE OUT A WAY TO GET PRAMS MORE EASILY DISTINCT?
*/
}


class GameScene: SKScene {

	/* Shortcuts */
	typealias G 	= Global
	typealias N 	= G.Nodes
	typealias A 	= G.Angles
	typealias XY 	= G.XnY
	
	typealias Sanity = G.Funcs.Sanity

	

	override func didMoveToView(view: SKView) {
		
		genericInits: do {
			
			Global.SELF = self
			XY.CENTER_SCREEN = CGPoint(x:CGRectGetMidX(G.SELF.frame),
			                           y:CGRectGetMidY(G.SELF.frame))
		}
		
		initCircles: do {
			
			Global.Nodes.central = Circle()
			G.SELF.addChild(N.central)
			
			N.central.runAction(SKAction.rotateToAngle(0, duration: 0.5))
			G.Angles.super_angle = N.central.zRotation
		}
		return // from DMtV
	}
	
	
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
			// The time NOW (basically) when started TB
			Global.time2.atBegan  = G.time.current

			// The next input (TM) will be our 'first drag' | error checking is good!
			Global.first_drag == false ? G.first_drag = true : printd("first drag was f\\ked")
		
			// Where we just clicked is our new y.current
			Global.XnY.y.current = Sanity.updateCurrentY( touch.locationInNode(self).y)
		}
		
		return // from TB
	}
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
		
			updateGlobesWithNewInfo: do {
				
				XY.y.previous = Sanity.updatePreviousY(currentY: XY.y.current)
				XY.y.current  = Sanity.updateCurrentY (touch.locationInNode(self).y)
			
				if G.first_drag == true {
				
					toggle(&G.first_drag)		 // This has to be false after first_entry
				
					G.time.previous 	= G.time.first // time.atTB compared with time.atMove
				}
			}
				
		
			// Paused (lateral)--no angle now--reset values
			guard (XY.y.current != XY.y.previous) else {
				
				printl("paused but didn't release")
					N.central.removeAllActions()
						XY.y_tuple = ("refreshed", 0,0,0)
				
				return // From guard
			}
			

			/**
			- TODO: Split this up into Acceleration | Adjustment | Action
			- note: return alias -> func definiton -> func call on globe
			1. Update smooth_y_tuple
			2. Update current Y coordinate to SmoothedY coordinate
			3. Do acceleration Maths
			4. adjust acceleration
			5. update any leftover globes
			6. create and return proper rotation action
			*/
			func findRotationAction(current_y: CGFloat) -> SKAction {
		
			// MARK: 1:
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
				//Global.XnY.y_tuple = setYTuple(globalYs: XY.y_tuple, currentY: current_y)
				//;
				
				
			// MARK: 2:
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
				// This is the new smoothed Y:
				XY.y.current	= setSmoothedY(yt: XY.y_tuple, cur_y: current_y, real_jump: 2)
				;

			// MARK: 3:
				typealias CFTI = CFTimeInterval
				typealias FirstPrevCur = (first: CFTI, previous: CFTI, current: CFTI)
				typealias AngleAsSpeed = CGFloat
				
				/// How fast we moved the cursor
				func findAcceleratedAngle(
																	//smoothed Y value from above (now essentailly the curY)
																	currentY smoothed_y: CGFloat,
				                          // Y values from glboe:
																  prevY previous_y:			CGFloat,
																  // Time values from globe
				                          timeFPC time: 				FirstPrevCur,
																  // Adjust to increase / decrease overall accel
																  accel_slider: 				CGFloat,
																  // how fast we go (in distance)
																	speedMinMax speed:		(min:CGFloat, max: CGFloat)
																)
					-> AngleAsSpeed
				{
					/*
					0. findAccel() -> doLogic() -> (how far to move wheel)
					1. Define math stuff
					2. Do logic stuff with math stuff
					*/
					
					let
						delta = (y: absV    (smoothed_y		- previous_y),		 // Delta Y (absv)
										 t: CGFloat (time.current - time.previous)), // Delta Time
					
						PPS		= (delta.y / delta.t),								// pixels per second:
					
						rads  = absV (PPS * -0.0025)							// How far it spins (speed)

					
					;
					
					// Return logic based on math above:
					Logic: do {
						
						if (rads + accel_slider) > speed.max	{
							return speed.max
						}
							
						else if (rads + accel_slider) < speed.min {
							return speed.min
						}
							
						else {
							return (rads + accel_slider)
						}
					}
				}
				;
				Global.Angles.angle.next
					= findAcceleratedAngle(currentY:  		XY.y.current,
					                       prevY: 	 			XY.y.previous,
					                       timeFPC: 			G.time,
					                       accel_slider:	Global.Config.accel_strength,
					                       speedMinMax:   G.Config.speed)
				
				printd(A.angle.next)
				;
				
				
			// MARK 4:
				typealias AngleToRotateTo = CGFloat
				typealias YFirstPrev			= (first: CGFloat, previous: CGFloat, current: CGFloat)
				
					// Next angle
					func adjustNextAnge(currentAngle current_angle: 				CGFloat,
														  nextAngle accelerated_angle:	CGFloat,
														  yFP y: YFirstPrev)
					-> AngleToRotateTo
					{
						// Dragged up (clockwise)
						if (y.first > y.previous) {
							return current_angle + accelerated_angle
						}
							
						// Dragged down (counterclockwise)
						else {
							return current_angle - accelerated_angle
						}
				}
				;
				Global.Angles.angle.next
					= adjustNextAnge(currentAngle: A.angle.current,
					                 nextAngle: A.angle.next,
					                 yFP: XY.y)
				HPRoItNT THIS SHIT OUT LOLfix() { printd(A.angle.next)}
				;
				
				
			// MARK: 5:
				func updatePrevTimeToCur(current_time: CFTI) -> CFTI {
						return current_time
				}
				;
				Global.time.previous = updatePrevTimeToCur(G.time.current)
				;
				
			// MARK: 6:
				// Our final calculation:
				let	fully_calibrated_action = SKAction.rotateToAngle(A.angle.next, duration: 0.0)

				// Annnd we're outta here!!
				return fully_calibrated_action
			}
			;
			let fully_handled_rotation_action_with_acceleration_and_smoothing
				= findRotationAction(XY.y.current)
			;
			
				runFoundAction: do {
				N.central.runAction(fully_handled_rotation_action_with_acceleration_and_smoothing)
				}
				
			return // From TM
			}
		}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
					XY.y_tuple = ("refreshed", 0,0,0)
	}
	
	
	
	override func update(currentTime: CFTimeInterval) {
		
		updateClock: do {
			/*
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
			
			
			*/
		}
		
		G.time.current = currentTime
		
		
	}//updat	
}//EoC

func shapeTex(node:SKShapeNode) {
	
	node.fillColor = UIColor.whiteColor()
	node.fillTexture = SKTexture.init(image: UIImage(named: "twistycenter")!)
}

