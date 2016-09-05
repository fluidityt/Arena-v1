import SpriteKit

/**
		// x = pps y = time in seconds
	y = −0.005x + 2.5

PPS = |change in pixels| / change in time


400 - 200					200
---------					---
1  -   .5					.5


*/


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
										 )													 	-> NSTimeInterval {

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
					min_speed 	:CGFloat = 2,
					max_speed 	:CGFloat = 0.5,
	
					/// dY:
					deltaY    	= absV(curY - prevY),
			
					/// dT:
					deltaT			= CGFloat(curT - prevT),
	
					/// pixels per second:
					PPS	= (deltaY / deltaT)
	
		var action_duration = ((PPS * -0.005) + 2.5)
	
		printd("pps  : \(PPS)")
		printd("ads  : \(action_duration)")
	
	// Set to min/max: \\
		/// (min/max speed is 100/400 PPS)
		if action_duration > 2 { action_duration = min_speed }
		if action_duration < 0.5 { action_duration = max_speed }
	
	// Debugging: \\
		printd("ADS  : \(NSTimeInterval(action_duration))")
		print("\n")
	
	// No cleanup :D
		return NSTimeInterval(PPS)

}

		
		