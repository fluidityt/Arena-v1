//
//  GameConfig.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

/** Directory for various configuration values
#### Usage:
		let config_instance       = DesiredStruct()

		desired_instance.variable = config_object.value
*/
struct ConfigFile: Directory {
	private init() {}
	
	
	/// Feeds data to various palces -- Has a static member
	struct GeneralConfig {
		
		var
		spawn_timer = 2.5,
		difficulty = NSTI(3),
		
		accel = (real_jump: CGFloat (20),
						 strength: CGFloat (0.001))
		
	
	};static let general = GeneralConfig()

	
	/// Feeds data into GameWheel
	struct WheelConfig: Immutable {

			= ( radius:     CGFloat(300),
					size: 	    CGSize(300/2),
					speed:
										( min: CGFloat (0.01),
										  max: CGFloat (0.4)),
					starting:
										( position: Position.center,
										  angle: CGFloat(0)))
		
		init() {
			size = CGSize(width:  self.radius/2, // Simple math
										height: self.radius/2)
			

		}
		
	}
	
	
	/// Feeds data into GameEnemy
	struct EnemyConfig: Immutable {
		
		// Explanation... see extension for config
		

		

		/// Config the enemy here... possibly put it in Global.Config.EnemyConfig?
		init(			difficultyLvl difficulty_level: NSTI,
			
			        sceneToAddTo scene: SKScene
		 )	{
			
			radius 			= 10
			move_speed 	= difficulty_level
			
			offset 			= CGP(x: radius/2, y: radius/2)
			bounds 			= CGP(x: ( scene.frame.width - offset.x ),
												y: ( scene.frame.height - offset.x ))
		}
		

	}
}