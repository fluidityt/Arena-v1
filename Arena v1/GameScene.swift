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
			
			// make our big circle
			initCircle: do {
			 let circle = SKShapeNode.init(circleOfRadius: 100)
				circle.fillColor = UIColor.redColor()
				 circle.position = CENTER_SCREEN
			  	addChild(circle)
				
				_=Hotfix() { print("How to attach to a parent")
				// make our smaller circles
				initSmallerCircle: do {
					let small_circle = SKShapeNode.init(circleOfRadius: 10)
						small_circle.position = CENTER_SCREEN
					
						small_circle.fillColor = UIColor.greenColor()
							self.addChild(small_circle)
						 		let MOVE_UP = CGVector(dx: 0, dy: 100)
								 small_circle.runAction(SKAction.moveBy(MOVE_UP, duration: 0))
									Hotfix(){
										circle.zPosition = -10
									  small_circle.zPosition = 2
										
									}
					}
					

				}//
			}// //
    }// // //
	
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
			
        for touch in touches {
            let location = touch.locationInNode(self)
					
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
					
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
					
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
					
            sprite.runAction(SKAction.repeatActionForever(action))
					
            self.addChild(sprite)
        }
    }
	
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

func copy() {}

