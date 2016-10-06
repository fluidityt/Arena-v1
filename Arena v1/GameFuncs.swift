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
		3. Do acceleration Maths (find delta Y and T, then find accelerated angle)
		4. adjust acceleration
		5. update any leftover globes
		6. create and return proper rotation action
*/
func findRotationAction (current_y: CGFloat) -> SKAction {

	// MARK: 1:
	mark1:do {
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

		// setYTuple:
		setYTuple:do {
			let y_tuple = G.XnY.y_tuple
			Global.XnY.y_tuple = setYTuple (globalYs: y_tuple, currentY: current_y)
		}
	}

	
	
	// MARK: 2:
	mark2:do {
		typealias TripleFloat = (String, CGFloat, CGFloat, CGFloat)
		typealias SmoothedY = CGFloat

		/**
		... Uses y_tuple and all the above to give us a smoother Y value,-
		-RJ # pix b4 active.. Logic algorythimg */
		func setSmoothedY (yt yt: TripleFloat,
											 cur_y: CGFloat,
											 real_jump: CGFloat
		) -> SmoothedY {

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

		setSmoothedY:do {
			let y_tuple2 = G.XnY.y_tuple
			Global.XnY.y.current = setSmoothedY (yt: y_tuple2, cur_y: current_y, real_jump: 2)
		}
	}



	// MARK: 3:
	mark3:do {
		typealias CFTI = CFTimeInterval
		typealias TimeFirstPrevCur = (first:CFTI, previous:CFTI, current:CFTI)
		typealias DeltaYAndTime = (y:CGFloat, t:CGFloat)

		/// Find the change in Y and Time since last move/drag
		func findDeltaYT (//smoothed Y value from above (now essentailly the curY)
											currentY smoothed_y: CGFloat,
											// Y values from glboe:
											prevY previous_y: CGFloat,
											// Time values from globe
											timeFPC time: TimeFirstPrevCur
		) -> DeltaYAndTime {

			let
			delta = (y: absV (smoothed_y - previous_y), // Delta Y (absv)
							 t: CGFloat (time.current - time.previous)) // Delta Time

			return delta
		}



		// MARK: 3.5:
		mark35:do {
			typealias AngleAsSpeed = CGFloat

			/// How fast we moved the cursor
			func findAcceleratedAngle (deltaYT delta: (y:CGFloat, t:CGFloat),
																 // Adjust to increase / decrease overall accel
																 accelSlider accel_slider: CGFloat,
																 // how fast we go (in distance)
																 speedMinMax speed: (min:CGFloat, max:CGFloat)
			) -> AngleAsSpeed {

				/*
					0. findAccel() -> doLogic() -> (how far to move wheel)
					1. Define math stuff
					2. Do logic stuff with math stuff																														`-f
				*/
		
		let
		
		PPS   = (delta.y / delta.t),									       // pixels per second
		
		rads  = absV (PPS * -0.0025)                         // How far it spins
		; 																																														//`f

				// Return logic based on math above:
				returnLogic:do {

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

			findDeltaAndAcceleratedAngle:do {

				// Find deltaYT:
				let
				current_y  = G.XnY.y.current,
				previous_y = G.XnY.y.previous,
				time_fpc   = G.time

				let delta_yt      = findDeltaYT (currentY: current_y,
																				 prevY: previous_y,
																				 timeFPC: time_fpc)


				// Find accelerateAngle:
				let
						accel_slider  = G.Config.accel_strength,
						speed_min_max = G.Config.speed

				Global.Angles.angle.next
				= findAcceleratedAngle (deltaYT: delta_yt,
																accelSlider: accel_slider,
																speedMinMax: speed_min_max)


				// Debugging:
				let next_angle = G.Angles.angle.next
				printd (next_angle)
			}
		}
	}



	// MARK 4:
	mark4:do {
		typealias AngleToRotateTo = CGFloat
		typealias YFirstPrev = (first:CGFloat, previous:CGFloat, current:CGFloat)

		/// Next angle
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

		adjustNextAngle:do {

			let
			current_angle = G.Angles.angle.current,
			next_angle    = G.Angles.angle.next,
			first_prev_y  = G.XnY.y

			Global.Angles.angle.next
			= adjustNextAngle (currentAngle: current_angle,
												 nextAngle: next_angle,
												 yFP: first_prev_y)
		}
		// FIXME:				HPRoItNT THIS SHIT OUT LOLfix() { printd(A.angle.next)}
	}

	

	// MARK: 5:																																										`-f
	typealias CFTI = CFTimeInterval
	
	func updatePrevTimeToCur (current_time: CFTI) -> CFTI {	return current_time	}									//`f

	uPTTC:do {
		let current_time = G.time.current
		Global.time.previous = updatePrevTimeToCur (current_time)
	}



	// MARK: 6:
	let next_angle              = G.Angles.angle.next
	let fully_calibrated_action = SKAction.rotateToAngle (next_angle, duration: 0.0)

	// The end!
	return fully_calibrated_action
}

