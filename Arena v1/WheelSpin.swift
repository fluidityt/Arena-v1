//
//  WheelSpin.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/23/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

extension F {
	
	/// Handles user input to determine direction, speed, acceleration, of the wheel.
	struct WheelSpin {
		
		
		// tM() -> rotateIt() -> rIDWA() -> accelTimer() -> smoothY() -> rotate()
		func rotateIt(object: SKNode) {
			
			// Find correct action
			let	next_angle = findNextAngle(<#T##current_angle: CGFloat##CGFloat#>, previous_y: <#T##CGFloat#>, current_y: <#T##CGFloat#>, previous_time: <#T##NSTimeInterval#>, current_time: <#T##NSTimeInterval#>)
				
				SKAction.rotateToAngle(next_angle, duration: 0.0)
			
			let doRotation = {
				// TODO: switch this to object:
				_central?.runAction(fully_handled_rotation_action)
			}
			
			doRotation()
		}
		
			
		/// Get inputs, figure out acceleration, figure out angle to rotate to, then rotate:
		func findNextAngle ( 	 current_angle		:CGFloat,
		                                  	 
		                                  	 previous_y			:CGFloat,
		                                  	 current_y				:CGFloat,
		                                  	 
		                                  	 previous_time		:NSTimeInterval,
		                                  	 current_time		:NSTimeInterval
			) -> CGFloat
		{
			
			// Locals: \\
			let
			/// Mucho SPino
			accel_coef	 = accelerateTimer(previous_y,
			          	                   curY: current_y,
			          	                   prevT: previous_time,
			          	                   curT: current_time),
			// Other stuff
			clock_spin 		= (0 - accel_coef),
			counter_spin 	= (0 + accel_coef),
			no_spin 			:CGFloat = 0,
			
			// Next angle used in SKaction
			next_angle: CGFloat = {
				
				// Paused (lateral)--no angle now--reset values
				guard ( current_y == previous_y) else {
					
					// TODO: get rid of globalz
					_=Hotfix() {
						printl("paused but didn't release")
						_central?.removeAllActions()
						y1 = 0; y2 = 0; y3 = 0
					}
					
					// Default
					return current_angle
				}
				
				// Drag up
				if (current_y > previous_y) {				return current_y + clock_spin				}
				
				// Drag down
				if (current_y < previous_y) { 			return current_y + counter_spin			}
			}()
			
		
			
			
			// Wrap up \\
			defer {
				
				///for temporal sanity
				let finished_y = current_y
				let finished_time = current_time
				
				///Update globes for next entry
				_prevY = finished_y
				_curY  = current_y
				
				_curA  = next_angle
				
				_timeThen = finished_time
			}
			
			return next_angle
		}
		
		// MAKE A DEBUGGING GRAPH?
		// TODO: Add per inches / accel slider / box
		static func accelerateTimer (
			prevY: CGFloat,
			curY : CGFloat,
			
			prevT: NSTimeInterval,
			curT : NSTimeInterval
			)													 	-> CGFloat {
			
			// Calculate PPS: \\
			let
			/// dY:
			deltaY    	= absV(curY - prevY),
			
			/// dT:
			deltaT			= CGFloat(curT - prevT),
			
			/// pixels per second:
			PPS	= (deltaY / deltaT)
			
			
			// Calculate Rads: \\
			let
			/// How far it spins..
			radian_spin = absV(PPS * -0.0025)
			
			// Calculate Speed: \\
			let
			/// Rads to spin in .0025 .5 for pc
			min_speed 	:CGFloat = 0.001,
			max_speed 	:CGFloat = 0.4,
			
			/// Adjust to increase / decrease overall accel
			accel_slider = CGFloat(0.001)
			//printd("rad  : \(CGFloat(radian_spin + accel_slider))n")
			
			return {
				
				/// (min/max speed is 100/400 PPS)
				if (radian_spin + accel_slider) > max_speed { return max_speed }
				if (radian_spin + accel_slider) < min_speed { return min_speed }
				else { return (radian_spin + accel_slider) }
				}()
			
		}
		
		// TODO: I could smooth the raw input, drop outliers, and smooth the accel
		static func smoothY(current_Y: CGFloat) -> CGFloat  {
			
			// Util:
			/// Reguires 3 y values
			func smooth(current_y: CGFloat) -> CGFloat {
				printd("smooth")
				
				return {
					
					/// Determines how many pixels count as a real jump (accel)
					let real_jump = CGFloat(2)
					
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
					
					
					}()///return
			}///smooth
			
			
			let smoothed_Y = smooth()
			
			// Logic..
			return {
				
				// Stack:
				if      y1 == 0 {	y1 = current_y; return y1}
				else if y2 == 0 { y2 = y1; y1 = current_y;	return average([y1,y2])	}
				else if y3 == 0 { y3 = y2; y2 = y1; y1 = current_y; return smooth() }
					
				else {
					
					// update stack:
					y3 = y2; y2 = y1; y1 = current_y
					return smooth()
				}
				}()
			
		}
		
	}
}

typealias FWS = F.WheelSpin
