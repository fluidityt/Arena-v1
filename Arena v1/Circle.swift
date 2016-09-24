//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


final class Circle: SKNode {
	var big: SKSpriteNode
	//var small: SKShapeNode
	
	override init() {
		
		big = SKSpriteNode(imageNamed: "twistycenter")
		big.size = CGSize(width: 300, height: 300)
		
		//small = SKShapeNode.init(circleOfRadius: 10)
		//small.fillColor = UIColor.greenColor()
		
		// Supra!
		super.init()
		
		self.position = CENTER_SCREEN
		//small.position = getCenter(self)
		big.position = getCenter(self)
		
		
		addChild(big)
		//addChild(small)
		
		//let MOVE_UP = CGVector(dx: 0, dy: 100)
		//self.small.runAction(SKAction.moveBy(MOVE_UP, duration: 0))
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


