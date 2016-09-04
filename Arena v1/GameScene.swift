//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.																	//
//

import SpriteKit

class GameScene: SKScene {
	override func didMoveToView(view: SKView) {
		
		// update our globes to work
		SELF = self
		
		
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

		
		central = Circle()
		self.addChild(central!)
		
		central?.runAction(SKAction.rotateToAngle(0, duration: 0.5))

		
	}//
	



	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
			Test (true, "T3: drag to rotate") {
				
				// entry: prevLoc = locationTB
				// moved: rotate in direction of locationTM
				// moved pt2: prevLoc = locationTM
				
				prevY = touch.locationInNode(self).y
			
			}//-
			
			
		}//
	}// //tb
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {
			
			
			Test (true, "test 4") {
				
				
				
				// How much to move each click
				let regular_increment :CGFloat = 0.25
				let increment_angle: CGFloat
				
				
				
				handleDirection: do {
					// Drag up
					if (touch.locationInNode(self).y) > prevY {
						
						//rotate clockwise
						increment_angle = (prevA + regular_increment)
						 let action = SKAction.rotateToAngle(increment_angle, duration:0)
							central?.runAction(action)
					}
						
					// Drag down
					else if (touch.locationInNode(self).y) < prevY {
						
						//rotate counter
						increment_angle = (prevA - regular_increment)
						 let action = SKAction.rotateToAngle(increment_angle, duration:0)
							central?.runAction(action)
					}
						
					// do nothing (movement was lateral)
					else {		return		}
					
				
				}//-
				
				
				// Reset for next entry
				defer {
					prevY = touch.locationInNode(self).y
					prevA = increment_angle
				}
				
				
				
				
			}//-test3
			
		}//
	}// //tm
	
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

func shapeTex(node:SKShapeNode) {

	node.fillColor = UIColor.whiteColor()
	node.fillTexture = SKTexture.init(image: UIImage(named: "twistycenter")!)
}

