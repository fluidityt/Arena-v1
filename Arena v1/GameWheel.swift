//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/// The wheel
struct Wheel: Singleton {					private init() {}
	
	// Mutating state because Swift :{
	private static var first_wheel: Bool?
	
	/// These are just the private configuration data
	struct Config {
		private let
		radius = CGFloat(300),
		
		position = Position.center,
		
		starting_angle = CGFloat(0)
	}
	
	
	// Make a new SpriteNode wheel and return it
	static func initNewWheel(editorNodeName name: String,
													sceneName scene: SKScene)
													
		-> SKSpriteNode  {

			if first_wheel != nil {	return SKSN()	}	// Make sure we don't make more than one wheel!
		
			self.first_wheel = false // because swift won't let me use LET as static
			
		
			let new_wheel: SKSN		// Our return object
			let config = Wheel.Config() // Object is for config
			
			new_wheel = scene.childNodeWithName(name) as! SKSN	// New sknode from scene editor
			
			new_wheel.size	= CGSize(width: wheel_config.radius/2, // Simple math
			              	         height: self.radius/2)
			
			// Translate member data into a CGPoint
			new_wheel.position = { () -> CGPoint in
				
				// If == center
				if position == center {
					return CGPoint( x: scene.frame.midX,
					                y: scene.frame.midY)
				}
				else
				{
					return self.position
				}
			}()
			
			OOP --> scene.addChild(new_wheel)			// Add to scene...
			
			// Sets the wheel to its starting angle
			OOP --> new_wheel.runAction(SKAction.rotateToAngle (0, duration: 0))
			
			printToLog("new wheel made")
			
			
			return new_wheel
	}
}
