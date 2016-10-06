//
//  GameFuncs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/// Test out stuff so it doesn't get too big...
struct GameStuff {

	static func DidMovinTaView (view: SKView) {

	}
}

//typealias Set = Global

/**
		- TODO: Split this up into Acceleration | Adjustment | Actions
		- TODO: Reset numbers (velocity) when change in direction detected
		- note: return alias -> func definiton -> func call on globe

		1. Update smooth_y_tuple
		2. Update current Y coordinate to SmoothedY coordinate
		3. Do acceleration Maths
		4. adjust acceleration
		5. update any leftover globes
		6. create and return proper rotation action
*/
func findRotationAction (current_y: CGFloat) -> SKAction {

	// MARK: 1:
	typealias TripleFloat = (String, CGFloat, CGFloat, CGFloat)

	/// Update stacks, determine which new Y value to deflate and return
	func setYTuple (globalYs ys: TripleFloat, currentY cur_y: CGFloat) -> TripleFloat {


		/*	TODO:	1. smooth the raw input drop outliers,
							2. and smooth the accel
		*/
		if ys.1 == 0 {
			return ("new_vals:", cur_y, ys.2, ys.3)        // y1 = current_y
		}

		else if ys.2 == 0 {
			return ("new_vals:", cur_y, ys.1, ys.3)        // y2 = y1; y1 = current_y
		}

		else if ys.3 == 0 {
			return ("new_vals:", cur_y, ys.1, ys.2)        // y3 = y2; y2 = y1; y1 = current_y
		}

		// FIXME: this is the same as above
		else {
			return ("new_vals:", cur_y, ys.1, ys.2)        // y3 = y2; y2 = y1; y1 = current_y
		}
	}
	
	Global.XnY.y_tuple = setYTuple (globalYs: XY.y_tuple, currentY: current_y)



	// MARK: 2:
	typealias SmoothedY = CGFloat

	/**
	... Uses y_tuple and all the above to give us a smoother Y value,-
	-RJ # pix b4 active.. Logic algorythimg */
	func setSmoothedY (yt yt: TripleFloat,
										 cur_y: CGFloat,
										 real_jump: CGFloat
	)	-> SmoothedY {

		//FIXME:
		let ys  = yt

		/// delta-absolute-value of y2-y1
		let dav = (y3y2: absV ((ys.3 - ys.2)),
							 y2y1: absV ((ys.2 - ys.1)))


		checkIfOnlyThreeInputs:do {
			// See last function for values that are carried over or were 0

			// Only first input
			if ys.1 == cur_y {
				return ys.1
			}

			// Only second input
			else if ys.2 == ys.1 {
				return average ([ys.1, ys.2])
			}
		}

		smoothFourthInput:do {
			// The acceleration is real:
			if (dav.y3y2 > real_jump) && (dav.y2y1 > real_jump) {
				return average ([ys.1, ys.2, ys.3])
			}

			// Slowing down?
			else if (dav.y3y2 > real_jump) && (dav.y2y1 < real_jump) {
				return average ([ys.2, ys.3])
			}

			// Speeding up?
			else if (dav.y3y2 < real_jump) && (dav.y2y1 > real_jump) {
				return average ([ys.1, ys.2])
			}

			// No accel:
			else if (dav.y3y2 < real_jump) && (dav.y2y1 < real_jump) {
				return average ([ys.1, ys.2, ys.3])
			}

			// IDK lol... need to add cases for y1 and y3 with y2 being outlier
			else {
				return average ([ys.1, ys.2, ys.3])
			}
		}
	}

	Global.XnY.y.current = setSmoothedY (yt: XY.y_tuple, cur_y: current_y, real_jump: 2)


	// MARK: 3:
	typealias CFTI = CFTimeInterval
	typealias FirstPrevCur = (first:CFTI, previous:CFTI, current:CFTI)
	typealias AngleAsSpeed = CGFloat

	/// How fast we moved the cursor
	func findAcceleratedAngle (//smoothed Y value from above (now essentailly the curY)
														 currentY smoothed_y: CGFloat,
														 // Y values from glboe:
														 prevY previous_y: CGFloat,
														 // Time values from globe
														 timeFPC time: FirstPrevCur,
														 // Adjust to increase / decrease overall accel
														 accel_slider: CGFloat,
														 // how fast we go (in distance)
														 speedMinMax speed: (min:CGFloat, max:CGFloat)
	) -> AngleAsSpeed {

		/*
				0. findAccel() -> doLogic() -> (how far to move wheel)
				1. Define math stuff
				2. Do logic stuff with math stuff																														`-f
		*/
			
			let
					delta = (y: absV (smoothed_y - previous_y),          // Delta Y (absv)
						       t: CGFloat (time.current - time.previous)), // Delta Time

					PPS   = (delta.y / delta.t),									       // pixels per second:

					rads  = absV (PPS * -0.0025)                         // How far it spins
			; 																																														//`f

		// Return logic based on math above:
		Logic:do {

			if (rads + accel_slider) > speed.max {
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

	Global.Angles.angle.next
	= findAcceleratedAngle (currentY: XY.y.current,
													prevY: XY.y.previous,
													timeFPC: G.time,
													accel_slider: G.Config.accel_strength,
													speedMinMax: G.Config.speed)

	printd (A.angle.next)



	// MARK 4:
	typealias AngleToRotateTo = CGFloat
	typealias YFirstPrev = (first:CGFloat, previous:CGFloat, current:CGFloat)

	// Next angle
	func adjustNextAngle (currentAngle current_angle: CGFloat,
												nextAngle accelerated_angle: CGFloat,
												yFP y: YFirstPrev
	) -> AngleToRotateTo {

		// Dragged up (clockwise)
		if (y.first > y.previous) {
			return current_angle + accelerated_angle
		}

		// Dragged down (counterclockwise)
		else {
			return current_angle - accelerated_angle
		}
	}

	Global.Angles.angle.next
	= adjustNextAngle (currentAngle: A.angle.current,
										 nextAngle: A.angle.next,
										 yFP: XY.y)

	//				HPRoItNT THIS SHIT OUT LOLfix() { printd(A.angle.next)}



	// MARK: 5:																																									`-f
	func updatePrevTimeToCur (current_time: CFTI) -> CFTI {	return current_time	}								//`f
	Global.time.previous = updatePrevTimeToCur (G.time.current)



	// MARK: 6:
	let fully_calibrated_action = SKAction.rotateToAngle (A.angle.next, duration: 0.0)
	return fully_calibrated_action
}

