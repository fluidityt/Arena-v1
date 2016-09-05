import SpriteKit

/**
		// x = pps y = radians to spin (in 0)
	y = −0.005x + 2.5

var radian_spin = absV((PPS * -0.005) + 0.01)

*/

// MAKE A DEBUGGING GRAPH?
// TODO: Add per inches / accel slider / box

func accelerateTimer (
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
					/// Rads to spin in 0
					min_speed 	:CGFloat = 0.005,
					max_speed 	:CGFloat = 1.5,
	
					/// Adjust to increase / decrease overall accel
					accel_slider = CGFloat(0.001)
					printd("rad  : \(CGFloat(radian_spin + accel_slider))\n")
	
		return {
		
			/// (min/max speed is 100/400 PPS)
			if (radian_spin + accel_slider) > max_speed { return max_speed }
			if (radian_spin + accel_slider) < min_speed { return min_speed }
			else { return (radian_spin + accel_slider) }
		}()

}


//printd("pps  : \(PPS)")


func deflateY(current_y: CGFloat) {

	
	return {
		// Stack:
		if y1 == 0 {	y1 = current_y; return y1}
		else if y2 == 0 { y2 = y1; y1 = current_y;	return y1		}
		else if y3 == 0 { y3 = y2; y2 = y1; y1 = current_y }
	}()

	func smooth() -> CGFloat {
		
		return {
			
			// The acceleration is real:
			if( (absV(y2 - y3) > 1) && (absV(y1 - y2) > 1) ){
				return
			}
		
		}()
	}
	func dropClose() {}

	func dropFar() 	{
	
	}

}
	


