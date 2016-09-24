//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global
import SpriteKit

class GameScene: SKScene {
	override func didMoveToView(view: SKView) {
		
		
		// update our globes to work
		SELF = self
		CENTER_SCREEN = CGPoint(x:CGRectGetMidX(SELF.frame),
		                        y:CGRectGetMidY(SELF.frame))
		
		initCircles: do {
			
				central = Circle()
				SELF.addChild(_central!)
				
				central?.runAction(SKAction.rotateToAngle(0, duration: 0.5))
				superAngle = _central!.zRotation
				
			}
		}
		
		
	}//
	
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches { disregard(touch)
			
			_firstDrag   = true
		 _firstY 		 = touch.locationInNode(self).y
			_firstTime = _timeNow
			
		}}// //tb
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		
		// Initials for temporal naming sanity \\
		if _firstDrag == true {
			_prevY 			= _firstY
			_timeThen 	= _firstTime
			_firstDrag	= false
			
			FirstEntry: do {
				// Paused (lateral)--no angle now--reset values
				guard (_curY == _prevY) else {
					
					// TODO: get rid of globalz
					_=Hotfix() {
						printl("paused but didn't release")
						_central?.removeAllActions()
						y1 = 0; y2 = 0; y3 = 0
					}
					
					return
				}
				
				// Enter the massive func!
				printd("going into wheelspin")
				let fully_handled_rotation_action_with_acceleration_and_smoothing
					= F.WheelSpin.findRotationAction(
						_curA,
						previous_y: 			_prevY,
						current_y: 				_curY,
						previous_time:	_timeThen,
						current_time: 	_timeNow
				)
				
				// Run it!
				_central?.runAction(fully_handled_rotation_action_with_acceleration_and_smoothing)
			}
			
			return
		}
		
	 // Do some shit \\
		for touch in touches {
			// Old stuff
			_prevY = _curY
			// New stuff
			_curY = touch.locationInNode(self).y
			
			
			// Not sure
			hitDetect()
			
			
			// Paused (lateral)--no angle now--reset values
			guard (_curY == _prevY) else {
				
				// TODO: get rid of globalz
				_=Hotfix() {
					//printl("paused but didn't release")
					_central?.removeAllActions()
					y1 = 0; y2 = 0; y3 = 0
				}
				
				return
			}
			
			// Enter the massive func!
			printd("going into wheelspin")
			let fully_handled_rotation_action_with_acceleration_and_smoothing
				= F.WheelSpin.findRotationAction(
					_curA,
					previous_y: 			_prevY,
					current_y: 				_curY,
					previous_time:	_timeThen,
					current_time: 	_timeNow
			)
			
			// Run it!
			_central?.runAction(fully_handled_rotation_action_with_acceleration_and_smoothing)
			
		}
		
	}// //tm
	
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		///Reset
		_central?.removeAllActions()
		y1 = 0; y2 = 0; y3 = 0
		
	}//te
	
	override func update(currentTime: CFTimeInterval) {
		
		updateClock: do {
			
			// Clocker...
			_clock_count += 1
			
			// Seconder...
			if _clock_count == 60 {
				
				_clock_count = 0
				_seconds += 1
			}
			
			// Spawner...
			if _seconds == 3 {
				
				enemySpawner()
				_seconds = 0
			}
			
			
			
		}
		
		_timeNow = currentTime
		
		
	}//update
	
	
	
	
}//EoC

func shapeTex(node:SKShapeNode) {
	
	node.fillColor = UIColor.whiteColor()
	node.fillTexture = SKTexture.init(image: UIImage(named: "twistycenter")!)
}

