//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/5/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit


// Declaration

/** BUllets spawn.. only in a local scope
#### Usage:
		sys.node.enemy = Enemy.makeNewEnemy()

- note: Requires data from ConfigFile
*/
struct En3emy: Static {
//
//	static func makeNewEnemy(oldEnemy old_enemy: EnemyNode? = nil,
//														sceneToAddTo scene: SKScene)
// -> EnemyNode {
//
//		// On first run:
//		if old_enemy == nil {
//			
//			let new_enemy = SKShapeNode()
//			scene.addChild(new_enemy)
//		
//			Tryout() {
//			
//				// Can this actually work? am I recursion god?
//				return	makeNewEnemy(oldEnemy: new_enemy,
//														 sceneToAddTo: scene)
//			}
//		}
//	
	
	
				
		
			// Give it a random position
	let new_position = { (config: Enemy) -> CGPoint in
		
			// Coords to spawnon (return):
			let 	x : CGFloat?
			let 	y : CGFloat?
			
			
			// Config Data to update our enemy instance with:
			let config = ConfigFile.EnemyConfig(difficultyLvl: 2.5,
			                                    sceneToAddTo: scene)
			
			// 1 top; 2 right; 3 bottom; 4 left
			let side_to_spawn_on = random(1, 4)
			// set coords:
			switch side_to_spawn_on {
				
			case 1:		// top
				x = random(config.offset.x, config.bounds.x)  - adjusted.width
				y = config.bounds.y 													- adjusted.height
				
			case 2:		// right
				x = config.bounds.x 													- adjusted.width
				y = random(config.offset.y, config.bounds.y)	- adjusted.height
				
			case 3:		// bottom
				x = random(config.offset.x, config.bounds.x) 	- adjusted.width
				y = config.offset.y														- adjusted.height
				
			case 4:		// left
				x = config.offset.x 													- adjusted.width
				y = random(config.offset.y, config.bounds.y)	- adjusted.height
				
			default:
				printError("problem in randysidepick")
				x = 0
				y = 0
			}
			
			new_enemy.position = CGP(x: x!, y: y!) // Positioning
		}
	
	// We're done:
		return new_enemy
	}
	
}// EoC
