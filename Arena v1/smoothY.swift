//// tM() -> rIDWA() -> accelTimer() -> smoothY()
//
//
//import Foundation
//import SpriteKit
//
//// TODO: I could smooth the raw input, as well as drop outliers, as well as smooth the accel
//func smoothY(current_y: CGFloat) -> CGFloat  {
//	
//	// Util:
//	/// Reguires 3 y values
//	func smooth() -> CGFloat {
//		printd("smooth")
//		
//		
//		return {
//			
//			/// Determines how many pixels count as a real jump (accel)
//			let real_jump = CGFloat(2)
//			
//			// The acceleration is real:
//			if		 (absV(y2 - y3) > real_jump)
//				&&
//				(absV(y1 - y2) > real_jump)	{	return average([y1,y2,y3])}
//				
//				// Slowing down?
//			else if (absV(y2 - y3) > real_jump)
//				&&
//				(absV(y1 - y2) < real_jump) { return average([y2,y3]) }
//				
//				// Speeding up?
//			else if (absV(y2 - y3) < real_jump)
//				&&
//				(absV(y1 - y2) > real_jump) { return average([y1,y2]) }
//				
//				
//				// No accel:
//			else if (absV(y2 - y3) < real_jump)
//				&&
//				(absV(y1 - y2) < real_jump) { return average([y1,y2,y3])}
//				
//				// IDK lol... need to add cases for y1 and y3 with y2 being outlier
//			else {  return average([y1,y2,y3]) }
//			
//			
//			}()///return
//	}///smooth
//	
//	// Logic..
//	return {
//		
//		// Stack:
//		if      y1 == 0 {	y1 = current_y; return y1}
//		else if y2 == 0 { y2 = y1; y1 = current_y;	return average([y1,y2])	}
//		else if y3 == 0 { y3 = y2; y2 = y1; y1 = current_y; return smooth() }
//			
//		else {
//			
//			// update stack:
//			y3 = y2; y2 = y1; y1 = current_y
//			return smooth()
//		}
//		}()
//	
//}
//
//
//
