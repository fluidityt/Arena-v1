//
//  U Optional.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation


/// Makes safe extensions array[safe: index]
extension Array {
	subscript(safe index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil }
}

/// Toggles a bool t / f
public func toggle (variable:Bool) -> Bool {
	if variable == true {				return false			}
	else {				return true			}
	
}

/// Runs code if not nil
func nilno (potentially_nil_value: Any?,_
						error_msg: String = "",_
						run_this: ()->())
-> String {

	guard potentially_nil_value != nil else {
		
		if error_msg == "" {
			return "-> nilno: Found a nil value!"
		}
		else {
			return error_msg
		}
	}
	
	run_this()
	return "-> nilno: found a value of \(potentially_nil_value)"
}


/// Not for homework
func safeAssign <ReturnType> (value_to_return: ReturnType?)
	-> ReturnType {
	
	// Ensure safety
	guard value_to_return != nil else {
		
		// Entry: found nil
		print ("SR -> 1  : SR: $0 was nil! Can't assign to lhs")
		
		// Value is irrelevant at this point--
		// --switching value_to_return would be confusing
		let type = value_to_return
		
		switch ReturnType.self {
			
		case is Int.Type:
			print("SR -> 2.1: assigning lhs to default Int >0<"); return 0 as! ReturnType
			
		case is String.Type:
			print("SR -> 2.2: assigning lhs to default String"); return "" as! ReturnType
			
		default:
			// In case our switch breaks, we will know why it crashes
			print("SR -> 2.0: No cases found--RTE incoming")
			
		}//switch/>
		
		// Should force crash, but at least I'll know exactly why
		return type!
		
	}//guard/>
	
	// Let's get out of here safely ;)
	//printv("SR -> Exit: Successfully Assigned lhs to \(value_to_return!)");
	return value_to_return!
	
}//safeAssign/>
		