
//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation


/** Utility with some oop becuase why not
#### See also: 
		- U Xcode.swift
*/
struct Debugging: Static {
	var z:() = link2xcode()
	
	static var counter_off = true
	
	static var counter = 5 { didSet { if counter_off { counter = 0 } } }
	
	static var 
	globe_verbose = false,
	code_group = false,
	logging = false,
	
	one_star = false,
	two_star = false
	

	/// Oop
	static func allOn() {
		globe_verbose = true
		code_group = true
		logging = true
		
		one_star = true
		two_star = true
	}
	
	/// Oop
	static func allOff() {
		globe_verbose = false
		code_group = false
		logging = false
		
		one_star = false
		two_star = false
	}
}