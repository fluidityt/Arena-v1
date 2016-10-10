//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/// The wheel
struct Wheel: Static {
	private init() {}
	
	/// Make a new SpriteNode wheel and return it
	static func makeNewWheel(editorNodeName name: String = "",
	                  sceneName scene: SKScene) -> SKSpriteNode	{
		
		
		// Load our config data from file
		let config = ConfigFile.WheelConfig()
		
		// Copy stuff
		//		if name != "" {
		//			let wheel_to_copy = scene.childNodeWithName(name) as! SKSN
		//			self.texture = wheel_to_copy.texture
		//		}
		
		// Our return bitch
		let new_wheel = scene.childNodeWithName("wheel") as! SKSpriteNode
		new_wheel.size	= config.size
		
		// Translate member data into a CGPoint
		new_wheel.position = setPosition(config.starting_position,
		                            scene: scene)
		
		OOP --> scene.addChild(new_wheel)			// Add to scene...
		
		// Sets the wheel to its starting angle
		OOP --> new_wheel.runAction(SKAction.rotateToAngle (0, duration: 0))
		
		printToLog("new wheel made")
		
		return new_wheel
	}
	
}
