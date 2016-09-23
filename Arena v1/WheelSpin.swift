//
//  WheelSpin.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/23/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


// MAKE A DEBUGGING GRAPH?
// TODO: Add per inches / accel slider / box

// Extend our function!
extension F {
	
	/// Handles user input to determine direction, speed, acceleration, of the wheel.
	struct WheelSpin {
		
		// tM() -> rotateIt() -> rIDWA() -> accelTimer() -> smoothY() -> rotate()
		static func findRotationAction( 	 current_angle		:CGFloat,
		                                	 
		                                	 previous_y			:CGFloat,
		                                	 current_y				:CGFloat,
		                                	 
		                                	 previous_time		:NSTimeInterval,
		                                	 current_time		:NSTimeInterval
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
				
			
			// TODO: I could smooth the raw input, drop outliers, and smooth the accel
			smoothed_y = {
				
				// Update our stacks, so we can determine which new Y value to deflate and return
				setValues: do {
					
					if y1 == 0 {
						
						y1 = current_y
					}
						
					else if y2 == 0 {
						
						y2 = y1
						y1 = current_y;
					}
						
					else if y3 == 0 {
						
						y3 = y2; y2 = y1; y1 = current_y;
					}
						
					else {
						
						y3 = y2; y2 = y1; y1 = current_y
					}
				}
				
				
				// Return values
				Logic: do {
					
					// Determines how many pixels count as a real jump (accel), for use in Logic
					// TODO: send this to pram
					let real_jump = CGFloat(2)
					
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
			}()
			
			
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
			
			
			// Next angle
			next_angle = {
				
				// Dragged up (clockwise)
				if (current_y > previous_y) {
					return current_angle + accelerated_angle!
				}
					
					// Dragged down (counterclockwise)
				else {
					return current_angle - accelerated_angle!
				}
				
			}()
			
			
			// Our final calculation:
			fully_calibrated_action = SKAction.rotateToAngle(next_angle!, duration: 0.0)
			
			
			// Update globes for next entry
			wrapUp: do {
				
				_prevY = current_y
				_curY  = smoothed_y!
				
				_curA  = next_angle!
				
				_timeThen = current_time
			}
			
			// Annnd we're outta here!!
			return fully_calibrated_action!
		}
	}
}

