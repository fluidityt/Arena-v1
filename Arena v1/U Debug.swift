
//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation


/// Utility with some oop becuase why not
struct Debugging: Static {
	
	static var counter_off = true
	
	static var counter = 5 { didSet { if counter_off { counter = 0 } } }
	
	static var 
	globe_verbose = false,
	
	one_star = false,
	two_star = false
	
	/// Oop
	static func allOn() {
		globe_verbose = true
		one_star = true
		two_star = true
	}
	
	/// Oop
	static func allOff() {
		globe_verbose = false
		one_star = false
		two_star = false
	}
}