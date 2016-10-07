import Foundation
import SpriteKit

// Float
func random(range_min: CGFloat,_ range_max: CGFloat) -> CGFloat {
	
	let min = UInt32(range_min)
	let max = UInt32(range_max)
	
	errorChecking: do {
	if min > max {
		print("random error, min greater than max")
		return 999999999
	}
	
	if min == max {
		print("random error, min == max")
		return CGFloat(min)
	}
	}
	
	let middle = (max - min)
	
	let result: UInt32 = {
		let rand = arc4random_uniform(middle)
		
		if rand == (max - 1) { return max }
		else								 { return rand }
	}()
	
	return CGFloat(result)
}

// Int
func random(range_min: Int,_ range_max: Int) -> Int {
	
	let min = UInt32(range_min)
	let max = UInt32(range_max)
	
	errorChecking: do {
		if min > max {
			print("random error, min greater than max")
			return 999999999
		}
		
		if min == max {
			print("random error, min == max")
			return Int(min)
		}
	}
	
	let middle = (max - min)
	
	let result: UInt32 = {
		let rand = arc4random_uniform(middle)
		
		if rand == (max - 1) { return max }
		else								 { return rand }
	}()
	
	return Int(result)
}

var counter = 0

while counter != 8 {
	counter += 1
	print(random(7,4))

}