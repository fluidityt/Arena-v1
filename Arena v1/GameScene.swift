//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.
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

	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
			
		for touch in touches {
			let location = touch.locationInNode(self)
		
			central?.position = location
			print(location)
			
		}
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
	}


    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

func copy() {}

