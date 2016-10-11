//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit


/** The wheel
#### Usage:
		sys.node.wheel = Wheel.makeNewEnemy()

- note: Requires data from ConfigFile
*/
struct Wheel: Directory {
	private init() {}
	
	/// Make a new SpriteNode wheel and return it
	static func makeNewWheel(editorNodeName name: String = "",
	                  sceneName scene: SKScene) -> SKSpriteNode	{
		
		
		// Load our config data from file
		let config = ConfigFile.WheelConfig()
		
		// TODO: Put a copy method here (from editor to new_wheel)
		
		// Our return bitch:
		let new_wheel
			= scene.childNodeWithName("wheel") as! SKSpriteNode
		
		// Set up:
		new_wheel.size	= config.size
		new_wheel.position = setPosition(config.starting_position,
		                            scene: scene)
		
		// Add to scene and rotate:
		OOP --> scene.addChild(new_wheel)
		OOP --> new_wheel.runAction(SKAction.rotateToAngle (0, duration: 0))
		
		// We're done:
		printToLog("new wheel made")
		return new_wheel
	}
	
}
