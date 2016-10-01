//
//  GameFuncs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit



func testCase () {

	var fun = 0

	switch fun {
		case 2:
			()
		default:
			()
	}
}

/// Test out stuff so it doesn't get too big...
struct GameStuff {
	static func DidMovinTaView(view: SKView)
	
	{}
}

/**
- TODO: Split this up into Acceleration | Adjustment | Action
- TODO: Reset numbers (velocity) when change in direction detected
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

	/// Update stacks, determine which new Y v	typealias FirstPrevCur = (first: CFTI, previous: CFTI, current: CFTI)
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
	
	//				HPRoItNT THIS SHIT OUT LOLfix() { printd(A.angle.next)}
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


