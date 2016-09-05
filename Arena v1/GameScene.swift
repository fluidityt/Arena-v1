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
		
		initCircles()
		
		
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
		}
		
	 // Do some shit \\
		for touch in touches {
			
			let TLOC = touch.locationInNode(self)
			let smoothed_y = deflateY(TLOC.y)
	
			hitDetect()
			
			rotateInDirectionWithAccel (
				current_angle: 		_curA,
				 previous_y: 			_prevY,
				 current_y: 			smoothed_y,
				  previous_time:	_timeThen,
				  current_time: 	_timeNow)
			
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

