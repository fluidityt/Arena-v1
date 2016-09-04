import SpriteKit

/**


PPS = |change in pixels| / change in time


400 - 200					200
---------					---
1  -   .5					.5


*/
func accelerateTimer (
								       prevY: CGFloat, curY: CGFloat,
                       prevT: NSTimeInterval, curT: NSTimeInterval
										 )
	-> NSTimeInterval {

	// TODO: Add per inches / accel slider / box
	
	// Util:
		func absV(number:CGFloat) -> CGFloat {
			if number >= 0 { return number }
			else if number < 0 { return (number * -1)}
			
			// Error
			return number = -1
		}
		
	// Locals:
		let
	
			// Time in seconds to rotate 360
			max_speed = 0.5,
			min_speed = 2,
	
			// dY:
			deltaY    = absV(curY - prevY),
	
			// dT:
			deltaT		= (curT - prevT),
		
			// I NEED TO CONVERT ;P
			PPS    		= (deltaY / deltaT)
		
		// (min/max speed is 100/400 PPS)
		if PPS > 400 { PPS = max_speed }
		if PPS < 100 { PPS = min_speed }
		
		return PPS as! NSTimeInterval

}

		
		