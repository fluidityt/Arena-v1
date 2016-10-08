import Foundation
import SpriteKit

// 1-100
// min = 50
// µax = 100
// new max = 100 - 50
// max = 50
// even newer max = 50 + 1
// rand = 0-50
// new rand = 0-50 + min

/// Random int
func random(min: Int,_ max: Int) -> Int {
	
	// Make sure we can progress the program (true = found error)
	func foundIntError (min2: Int,_
										   max2: Int)
		-> Bool {
			
			if min2 > max2 {
				print("random INT error, min (\(min2)) greater than max (\(max2))")
				return true
			}
				
			else if min2 == max2 {
				print("random INT error, min == max  (\(min2))")
				return true
			}
			
			return false
	}
	
	if foundIntError(min, max)  {
		// Should cause problems!
		print ("random: returning (\(min) -1")
		return min - 1
	}
	
	// Trash values for math:
	let
	min3 = UInt32(min),
	max3 = UInt32(max),
	new_max = ((max3 - min3) + 1)
	
	// Random value to return:
	let
	result  = arc4random_uniform(new_max),
	result2 = result + min3,
	result3 = Int(result2)
	
	return result3
}

/// Rnadom float (no decimals)
func random(min: CGFloat,_ max: CGFloat) -> CGFloat {
	
	// Make sure we can progress the program (true = found error)
	func foundCGFloatError (min2: CGFloat,_
		max2: CGFloat)
		-> Bool {
			
			if min2 > max2 {
				print("random CGFloat error, min (\(min2)) greater than max (\(max2))")
				return true
			}
				
			else if min2 == max2 {
				print("random CGFloat error, min == max  (\(min2))")
				return true
			}
			
			return false
	}
	
	if foundCGFloatError(min, max)  {
		// Should cause problems!
		print ("random: returning (\(min) -1")
		return min - 1
	}
	
	// Trash values for math:
	let
	min3 = UInt32(min),
	max3 = UInt32(max),
	new_max = ((max3 - min3) + 1)
	
	// Random value to return:
	let
	result  = arc4random_uniform(new_max),
	result2 = result + min3,
	result3 = CGFloat(result2)
	
	return result3
}



