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
		
		
			Test(true, "try 2") {
			
				class Circle: SKNode {
					var big: SKShapeNode
					var small: SKShapeNode
					
					override init() {
				
						big = SKShapeNode.init(circleOfRadius: 100)
						 big.fillColor = UIColor.redColor()

						small = SKShapeNode.init(circleOfRadius: 10)
						 small.fillColor = UIColor.greenColor()
						
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
				
				}//--
				
				central = Circle()
				self.addChild(central!)
				
				
				
			}//
	}// //
	
//	let location = touch.locationInNode(self)


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
			
			
			Test (true, "test 3") {
				
				//rotate clockwise
				if (touch.locationInNode(self).y) > prevY {
					
					let action = SKAction.rotateByAngle(CGFloat(12.0), duration:0)
					 central?.runAction(action)
				}
					
				//rotate counter
				else if (touch.locationInNode(self).y) < prevY {
					
					let action = SKAction.rotateByAngle(CGFloat(-12.0), duration:0)
					 central?.runAction(action)
				}
					
				//do nothing (movement was lateral)
				else {		return		}
				
				// Reset for next entry
				defer { prevY = touch.locationInNode(self).y }
				
			}//-test
			
		}//
	}// //tm
	
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

func copy() {}

