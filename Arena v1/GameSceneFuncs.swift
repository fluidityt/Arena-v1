//
//  GameSceneFuncs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


func handleDirection(touch:UITouch) {

	// Acceleration
	_accel += 1

	// How much to move each click
	let regular_increment :CGFloat = 0.25
	let increment_angle: CGFloat
	
	logic: do {
		// Drag up
		if (touch.locationInNode(SELF).y) > _prevY {
			
			//rotate clockwise
			increment_angle = (_prevA + regular_increment)
			
			_central?.runAction(
					SKAction.rotateToAngle(increment_angle, duration:0))
		}
			
			// Drag down
		else if (touch.locationInNode(SELF).y) < _prevY {
			
			//rotate counter
			increment_angle = (_prevA - regular_increment)
			_central?.runAction(
					SKAction.rotateToAngle(increment_angle, duration:0))
		}
			
			// do nothing (movement was lateral)
		else {		return; print("error??")	}
	}
	
	// Reset for next entry
	_prevY = touch.locationInNode(SELF).y
	_prevA = increment_angle
	
	
}

func initCircles() {
	
	
	class Circle: SKNode {
		var big: SKSpriteNode
		var small: SKShapeNode
		
		override init() {
			
			big = SKSpriteNode(imageNamed: "twistycenter")
			big.size = CGSize(width: 200, height: 200)
			
			small = SKShapeNode.init(circleOfRadius: 10)
			small.fillColor = UIColor.greenColor()
			
			// Supra!
			super.init()
			
			self.position = CENTER_SCREEN
			small.position = getCenter(self)
			big.position = getCenter(self)
			
			
			addChild(big)
			addChild(small)
			
			let MOVE_UP = CGVector(dx: 0, dy: 100)
			self.small.runAction(SKAction.moveBy(MOVE_UP, duration: 0))
			
		}
		
		required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
	
	
	_central = Circle()
	SELF.addChild(_central!)
	
	_central?.runAction(SKAction.rotateToAngle(0, duration: 0.5))

}