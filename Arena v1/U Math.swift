//
//  U Math.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

/// Absolute-value
func absV(num:CGFloat) -> CGFloat {
	return {	if num >= 0 { return num}	else { return (num * -1) }	}()
}

/// Slope
func slope(y1 y1: CGFloat, y2: CGFloat,
              x1:CGFloat, x2:CGFloat)  -> CGFloat {	let	dY = (y2 - y1),
																												dX = (x2 - x1),
																												slope = (dY / dX)
	return slope
}

/// Averages cgfloat
func average (nums: [CGFloat]) -> CGFloat {	var total = CGFloat(0)
																						for num in nums {total += num}
	return (total / CGFloat(nums.count))
}

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




