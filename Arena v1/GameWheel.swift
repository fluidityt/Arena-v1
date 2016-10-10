//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/// The wheel
class Wheel: SKSpriteNode {
	
	/// Make a new SpriteNode wheel and return it
	init(editorNodeName name: String = "",
			sceneName scene: SKScene)
	{

		// Load our config data from file
		let config = ConfigFile.WheelConfig()
		
		// Copy stuff
		if name != "" {
			let wheel_to_copy = scene.childNodeWithName(name) as! SKSN
			self.texture = wheel_to_copy.texture
		}
		
		self.size	= config.size
		
		// Translate member data into a CGPoint
		self.position = setPosition(config.starting_position,
		                            scene: scene)
		
		OOP --> scene.addChild(self)			// Add to scene...
		
		// Sets the wheel to its starting angle
		OOP --> self.runAction(SKAction.rotateToAngle (0, duration: 0))
		
		printToLog("new wheel made")
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
