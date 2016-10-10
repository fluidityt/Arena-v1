//
//  initCircles.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/3/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/// The wheel
struct Wheel: Singleton {
	// Singleton insurance:
	private init() { }
	private static var first_init = true
	
	// These are just the private configuration data
	private static let
	center = CGPoint(x: 0.5, y: 0.5),
	
	radius = CGFloat(300),
	
	position : CGPoint = center,
	
	starting_angle = CGFloat(0)
	
	
	// Make a new SpriteNode wheel and return it
	static func initNewWheel(editorNodeName name: String, sceneName scene: SKScene)
		-> SKSpriteNode  {
			
			// Enforce singleton
			guard first_init == false else {
				print(" WHY ARE YOU MAKING A SECOND WHEEL???")
				return SKSpriteNode()
			}
						
			let new_wheel: SKSN
			
			new_wheel = scene.childNodeWithName(name) as! SKSN	// New sknode from scene editor
			
			new_wheel.size	= CGSize(width: self.radius/2, // Simple math
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
			
			self.first_init = false				// Critical logic to single insurance
			
			return new_wheel
	}
}
