import SpriteKit

/**


PPS = |change in pixels| / change in time


400 - 200					200
---------					---
1  -   .5					.5


*/
func accelerateTimer (
								       prevY: CGFloat = _prevY,
								       curY : CGFloat = _curY,
								       
                       prevT: NSTimeInterval = _timeThen,
                       curT : NSTimeInterval = _timeNow
										 )													 	-> NSTimeInterval {

	// TODO: Add per inches / accel slider / box
	
	// Util:
		func absV(number:CGFloat) -> CGFloat {
			if number >= 0 { return number }
			else if number < 0 { return (number * -1)}
			
			// Error
			return number-1
		}
		
		
		// Locals:
		let
					// Time in seconds to rotate 360
					max_speed 	:CGFloat = 0.5,
					min_speed 	:CGFloat = 2,
			
					// dY:
					deltaY    	= absV(curY - prevY),
			
					// dT:
					deltaT			= CGFloat(curT - prevT)
		
		
		var	PPS	= (deltaY / deltaT)
		
	
	
	// (min/max speed is 100/400 PPS)
		if PPS > 400 { PPS = max_speed }
		if PPS < 100 { PPS = min_speed }
	
	// No cleanup :D
		printl(NSTimeInterval(PPS))
		return NSTimeInterval(PPS)

}

/*
		accel works but my tests don't?
*/






		
		