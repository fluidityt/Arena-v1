import SpriteKit

/**
		// x = pps y = radians to spin (in 0)
	y = −0.005x + 2.5


*/

// MAKE A DEBUGGING GRAPH?


func slope(y1 y1: CGFloat, y2: CGFloat, x1:CGFloat, x2:CGFloat) -> CGFloat {
	
	let
 			dY = (y2 - y1),
			dX = (x2 - x1),
	
			slope = (dY / dX)
	
	
	return slope
}


func accelerateTimer (
								       prevY: CGFloat,
								       curY : CGFloat,
								       
                       prevT: NSTimeInterval,
                       curT : NSTimeInterval
										 )													 	-> CGFloat {

	// TODO: Add per inches / accel slider / box
	
	// Util: \\
		func absV(number:CGFloat) -> CGFloat {
		
			if number >= 0 { return number }
			else if number < 0 { return (number * -1)}
			
			///Error
			return number-1
		}

	// Locals: \\
		let
					/// Time in seconds to rotate 360
					min_speed 	:CGFloat = 0.05,
					max_speed 	:CGFloat = 2,
	
					/// dY:
					deltaY    	= absV(curY - prevY),
			
					/// dT:
					deltaT			= CGFloat(curT - prevT),
	
					/// pixels per second:
					PPS	= (deltaY / deltaT)
	
		var radian_spin = absV((PPS * -0.005) + 0.01)
	
		printd("rad1  : \(radian_spin)")
	
	// Set to min/max: \\
		/// (min/max speed is 100/400 PPS)
		if radian_spin > max_speed { radian_spin = max_speed }
		if radian_spin < min_speed { radian_spin = min_speed }
	
	// Debugging: \\
		printd("rad2  : \(CGFloat(radian_spin))")
		print("\n")
	
	// No cleanup :D
		return CGFloat(radian_spin)

}


//printd("pps  : \(PPS)")
		