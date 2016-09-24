//
//  global.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

/// GAME DATA AND BLUEPRINTS
class GameDataAndStructs: Static { required init(mustBePrivate: Static){}; private init(){}
	
	
	
	/*
	struct definition -> game data definition -> sp definition
	
	on entry:
	1. SP holds one instance of GD
	2. GD holds one instance of each GS
	*/
	
	/// Blueprints for GameData object
	struct Structs: Static {					required init(mustBePrivate: Static){}; private init(){}
		
		struct Nodes {
			var error_node = SKNode?()
			var node_list = [SKNode()]
			let player = SKSpriteNode()
			var central: SKNode
		}
		
		struct CoordsAngles {
			// Prev/cur
			var
			firstY: CGFloat = 0,
			prevY: CGFloat = 0,
			curY: CGFloat = 0,
			curA: CGFloat = 0,
			
			superAngle = CGFloat(0)
			let full_circle = 6.281
			
		}
		
		struct Clock {
			
			var
			clock_count = 0,
			seconds = 0,
			
			firstTime: CFTimeInterval=0,
			timeThen: CFTimeInterval=0,
			timeNow: CFTimeInterval=0
			
		}
		
		struct Smoothing {
			var
			y1 = CGFloat(0),
			y2 = CGFloat(0),
			y3 = CGFloat(0)
		}
		
		struct Other {
			var	firstDrag = false
		}
		
	}; typealias GS = GameStructs
	
	
	// data
	struct Data {
		
		// All my data... would be easy as var... lol
		let
		coord_data: GS.Coords,
		
		
	}; typealias GD = GameData
	
}