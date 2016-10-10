//
//  UtilOperators.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation



									/* MARK: Debug */

// Check when globes go in pram and for readability
prefix operator <- {}
prefix func <-<T> (data: T) -> T {
	if Debugging.globe_verbose {
		print(" Globe passed in parameter: \(data)")
	}
	return data
}

// One star debugger
postfix operator +* {}
postfix func +*<T> (data: T) -> T {
	if Debugging.one_star {
		Debugging.counter += 1
		print("\(Debugging.counter) *: \(data)")
	}
	return data
}

// Two star debugger
postfix operator +** {}
postfix func +**<T> (data: T) -> T {
	if Debugging.two_star {
		Debugging.counter += 1
		print("\(Debugging.counter) **: \(data)")
	}
	return data
}

