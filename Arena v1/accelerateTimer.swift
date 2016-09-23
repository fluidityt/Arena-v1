//import SpriteKit
//// tM() -> rIDWA() -> accelTimer() -> smoothY()
//
///**
//		// x = pps y = radians to spin (in 0)
//	y = −0.005x + 2.5
//
//var radian_spin = absV((PPS * -0.005) + 0.01)
//
//*/
//
//// MAKE A DEBUGGING GRAPH?
//// TODO: Add per inches / accel slider / box
//
//func accelerateTimer (
//								       prevY: CGFloat,
//								       curY : CGFloat,
//								       
//                       prevT: NSTimeInterval,
//                       curT : NSTimeInterval
//										 )													 	-> CGFloat {
//
//	// Calculate PPS: \\
//		let
//					/// dY:
//					deltaY    	= absV(curY - prevY),
//			
//					/// dT:
//					deltaT			= CGFloat(curT - prevT),
//	
//					/// pixels per second:
//					PPS	= (deltaY / deltaT)
//	
//	
//	// Calculate Rads: \\
//		let
//					/// How far it spins..
//					radian_spin = absV(PPS * -0.0025)
//	
//	// Calculate Speed: \\
//		let
//					/// Rads to spin in .0025 .5 for pc
//					min_speed 	:CGFloat = 0.001,
//					max_speed 	:CGFloat = 0.4,
//	
//					/// Adjust to increase / decrease overall accel
//					accel_slider = CGFloat(0.001)
//						//printd("rad  : \(CGFloat(radian_spin + accel_slider))n")
//	
//		return {
//		
//			/// (min/max speed is 100/400 PPS)
//			if (radian_spin + accel_slider) > max_speed { return max_speed }
//			if (radian_spin + accel_slider) < min_speed { return min_speed }
//			else { return (radian_spin + accel_slider) }
//		}()
//
//}
//
//
////printd("pps  : \(PPS)")
