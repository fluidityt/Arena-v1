//
//  GameConfig.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

struct ConfigFile: Static {
	private init() {}
	
	// Adjust this later
	static let
	spawn_timer = 2.5,
	difficulty: NSTimeInterval = 3,
	
	real_jump      = CGFloat (20),
	accel_strength = CGFloat (0.001),
	speed          = (min: CGFloat (0.01), // The min/max speed is 100/400 PPS
										max: CGFloat (0.4))		// ...which is distance actuall
	

	struct WheelConfig {
		
		let
		radius = CGFloat(300),
		size: CGSize, 		// = radius/2
		
		starting_position = Position.center,
		starting_angle = CGFloat(0)
		
		init() {
			size = CGSize(width:  self.radius/2, // Simple math
										height: self.radius/2)
		}
		
	}
	
	struct EnemyConfig {
		
		
		// Explanation... see extension for config
		let
		radius: CGFloat, 	  					// how big the circle enemy is
		difficulty: NSTimeInterval,	// How fast it moves towards teh center
		
		offset: CGPoint, 			// Offsets of bounds (maybe set to .5 of enemy diameter?)
		bounds: CGPoint 		 // Boundaries of the fram
		
		
		/// Config the enemy here... possibly put it in Global.Config.EnemyConfig?
		init(difficultyLvl difficulty_level: NSTI = ConfigFile.difficulty,
				 sceneToAddTo scene: SKScene )	{
			
			radius 			= 10
			difficulty 	= difficulty_level
			
			offset 			= CGP(x: radius/2, y: radius/2)
			bounds 			= CGP(x: ( scene.frame.width - offset.x ),
												y: ( scene.frame.height - offset.x ))
		}
		

	}
}