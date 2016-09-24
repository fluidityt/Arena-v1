//
//  Funcs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/23/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


// Extended with funcs in proper fiels
struct Funcs: Static {
	
	static func getCenter(node:SKNode) -> CGPoint {
		return (CGPoint(x:CGRectGetMidX(node.frame),
			y:CGRectGetMidY(node.frame)))
	}
	
	
}
typealias F = Funcs

