//
//  updated.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/5/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//
import SpriteKit

/*
	struct FindRotationAction: Static {
*/

/** FindRotationAction is a dir for 7 static funcs

#### TODO: Split this up into Acceleration | Adjustment | Actions
#### TODO: Reset numbers (velocity) when change in direction detected

#### Overview:

	1. Use currentY to Update smooth_y_tuple

	2. Use yTuple to smooth currentY

	3. use (the new) currentY to find delta Y and T

	4. Use deltaYT to find find accelerated angle

	5. Use acceleratedAngle to tweak acceleration

	6. Update globes to reflect changes in 1-5

	7. Use 1-6 to create and return the proper SKAction


#### typealiase:

		- AngleAsSpeed = CGFloat


		- AngleToRotateTo = CGFloat


		- TripleFloat = (String, CGFloat, CGFloat, CGFloat)


		- SmoothedY = CGFloat


		- CFTI = CFTimeInterval


		- DeltaYAndTime = (y:CGFloat, t:CGFloat)


		- TimeFirstPrevCur = (first: CFTI, previous: CFTI, current: CFTI)


		- YFirstPrev = (first:CGFloat, previous:CGFloat, current: CGFloat)

		- MinMax = (min: CGFloat, max: CGFloat)

*/
struct FindRotationAction: Static {
	
	// Aliases:
	typealias AngleAsSpeed = CGFloat
	typealias AngleToRotateTo = CGFloat
	typealias YFirstPrev = (first:CGFloat, previous:CGFloat, current:CGFloat)

	typealias TripleFloat = (String, CGFloat, CGFloat, CGFloat)
	typealias SmoothedY = CGFloat
	typealias CFTI = CFTimeInterval
	typealias TimeFirstPrevCur = (first:CFTI, previous:CFTI, current:CFTI)
	typealias DeltaYAndTime = (y:CGFloat, t:CGFloat)

	typealias FRA = FindRotationAction
	typealias MinMax = (min: CGFloat, max: CGFloat)

	
/** Func 1 of 6
	
	- note: Update stacks, determine which new Y value to deflate and return
	
	### TODO:
	1. smooth the raw input drop outliers,
	2. and smooth the accel

	### Usage:
	
		Global.XnY.y_tuple = setTupleY(
			globalYs: Global.XnY.y_tuple,
			currentY: touch.locationInNode(self).y)
*/
	static func setTupleY (
			globalYs ys: TripleFloat,
			currentY cur_y: CGFloat
	) -> TripleFloat {


		
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



/**		2 of 6
- note: Uses y_tuple and all the above to give us a smoother Y value,
	RJ # pix b4 active.. Logic algorythimg

#### Usage:
		Global.XnY.y.current = setSmoothedY (
			yTuple: Global.XnY.y_tuple,
			curY: touch.locationInNode(self).y
			realJump: Global.Config.real_jump)
	
*/
	static func smoothCurrentY (yTuple yt: TripleFloat,
														currentY cur_y: CGFloat,
														realJump real_jump: CGFloat
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
	


/** 3 of 7
- note: Find the change in Y and Time since last move/drag
	
#### Usage:
	
		let delta_yt = findDeltaYT (
			currentY: G.XnY.y.current,
			prevY: G.XnY.y.previous,
			timeFPC: G.time)
*/
	static func findDeltaYT (//smoothed Y value from above (now essentailly the curY)
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


	
/** 4 of 7
- note: How fast we moved the cursor
	
#### Usage:
	
		Global.Angles.angle.next = findAcceleratedAngle (
			deltaYT: delta_yt,
			accelSlider: G.Config.accel_strength,
			speedMinMax: G.Config.speed)
*/
	static func findAcceleratedAngle (deltaYT delta: (y:CGFloat, t:CGFloat),
														 // Adjust to increase / decrease overall accel
														 accelSlider accel_slider: CGFloat,
														 // how fast we go (in distance)
														 speedMinMax speed: (min:CGFloat, max:CGFloat)
	) -> AngleAsSpeed {

		
		let PPS  = (delta.y / delta.t) 							// pixels per second
		let	rads = absV (PPS * -0.0025)             // How far it spins
		
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



/** 5 of 7
- note: Next angle
	
#### Usage:
	
		Global.Angles.angle.next = adjustNextAngle (
			currentAngle: 	Global.angles.current_angle,
			nextAngle:    	Global.angles.next_angle,
			yFP:						Global.XnY.y)
	
*/
	static func adjustNextAngle (currentAngle current_angle: CGFloat,
												accelAngle accelerated_angle: CGFloat,
												yFirstPrev y: YFirstPrev
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

		
	
/** 6 of 7
- note: requires mutability in prams
	
#### Usage:
	
		Global.time.previous = updatePrevTimeToCur (current_time)
*/

	

/** 7 of 7
- note: Return action

#### Usage:
		let rotation_action = makeAction(Global.Angles.angle.next)
*/
	static func makeAction (next_angle: CGFloat) -> SKAction {

		let fully_calibrated_action = SKAction.rotateToAngle (next_angle, duration: 0.0)

		return fully_calibrated_action
	}
	
	
	
/** Call this on the action you want to run in touchesMoved()

- note:
	
#### Usage:
	
		let fully_handled_action = FindRotationAction(initialY: tloc.y)
		
		runAction(fully_handled_action)
*/
	static func implement1thru7(
			inout globalCurrentY 	  		_G__current_y: 			CGFloat,

			// This updates in touchesMoved()
			globalPreviousY				_G__previous_y: 		CGFloat,
			               				
			inout globalYTuple				 	_G__y_tuple: 				TripleFloat,
			            				 	
			globalRealJump 				_G__real_jump: 			CGFloat,
			               				
			globalTimeFPC					_G__time_fpc: 			TimeFirstPrevCur,
			             					
			globalAccelSlider		 	_G__accel_slider: 	CGFloat,
			                 		 	
			globalSpeedMinMax 		_G__speed_minmax: 	MinMax,
			                  		
			globalCurrentAngle 		_G__current_angle: 	CGFloat,

			inout globalNextAngle				_G__next_angle:			CGFloat,
			                   		
			globalYFirstPrev 			_G__y_firstprev: 		YFirstPrev)
		
		-> SKAction {
			
		// 1:
		let _L__y_tuple = setTupleY(
			globalYs: _G__y_tuple,
			currentY: _G__current_y
		)
		
		// 2:
		let _L__y_current = smoothCurrentY(
			yTuple:   _L__y_tuple,
			currentY: _G__current_y,
			realJump: _G__real_jump
		)
		
		// 3:
		let _L__delta_yt = findDeltaYT(
			currentY: _L__y_current,
			prevY: _G__previous_y,
			timeFPC: _G__time_fpc
		)
		
		// 4:
		let _L__accel_angle = findAcceleratedAngle(
			deltaYT: _L__delta_yt,
		  accelSlider: _G__accel_slider,
		  speedMinMax: _G__speed_minmax
		)
		
		// 5:
		let _L__next_angle = adjustNextAngle(
			currentAngle: _G__current_angle,
			accelAngle:  _L__accel_angle,
			yFirstPrev: _G__y_firstprev
		)
		
		
		// 6:
		let _L__final_action = makeAction(_L__next_angle)
		
		
		// 7:
		let globes_successfully_updated = true //updatedglobes
		
		// Update globes with _L_ values
		updateGlobes: do {
		
			_G__current_y = _L__y_current
			_G__y_tuple = _L__y_tuple

			// update CurrentAngle in touchesMoved()
			_G__next_angle = _L__next_angle
		}
		// End:
		if globes_successfully_updated == true {
			return _L__final_action
		}
		else {
			printl("Prabrems in findaction")
			return SKAction.moveTo(CGPoint(x: 0, y: 0), duration: 0)
		}
	}
	
	/// This is a static struct
	private init() {}
}