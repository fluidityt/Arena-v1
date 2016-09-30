//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/5/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

extension F {
	
	
	func enemySpawner() {
		
		// make our toon
		let
		enemy = SKShapeNode.init(circleOfRadius: 10),
		random_color = (arc4random_uniform(3) + 1)
		
		// Find a color
		switch random_color {
		case 1:
			//blue
			enemy.fillColor = UIColor.blueColor()
		case 2:
			//green
			enemy.fillColor = UIColor.greenColor()
		case 3:
			//red
			enemy.fillColor = UIColor.redColor()
		default:
			()
		}
		
		
		// lets get randy..
		let
		randomX = randy(Int(Global.SELF.frame.width)),
		randomY = randy(Int(Global.SELF.frame.height))
		
		
		// do stuff
		enemy.position = CGPoint(x: randomX, y: randomY)
		Global.SELF.addChild(enemy)
		
		// more stuff
		enemy.runAction(SKAction.moveTo(Global.Nodes.central.position, duration: 3))
		
	}
}
