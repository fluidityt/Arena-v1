//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.
import SpriteKit

class GameScene: SKScene {
	override func didMoveToView(view: SKView) {
		
		// update our globes to work
		SELF = self
		
		initCircles()
		
		
	}//
	

	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches { disregard(touch)
			
		_firstY = touch.locationInNode(self).y
		 first_drag = true
	
		}}// //tb
	
	
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		
		if first_drag == true {		_prevY = _firstY	}
		
		for touch in touches {
			
			handleDirection (current_y: touch.locationInNode(self).y)
			
			
		}}// //tm
	
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		// Reset
		_central?.removeAllActions()
		
	}//te
	
  override func update(currentTime: CFTimeInterval) {
		
		updateClock: do {
			_clock_count += 1
			
			if _clock_count == 60 {
				_clock_count = 0
				_seconds += 1
				print(_seconds, _accel, currentTime)
				
			}
	}
		
		_time = currentTime
		
	}//update

	


}//EoC

func shapeTex(node:SKShapeNode) {

	node.fillColor = UIColor.whiteColor()
	node.fillTexture = SKTexture.init(image: UIImage(named: "twistycenter")!)
}

