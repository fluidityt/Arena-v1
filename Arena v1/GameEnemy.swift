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
struct Enemy: Static {
typealias EnemyNode = SKShapeNode
	
	static func makeNewEnemy(oldEnemy old_enemy: EnemyNode? = nil,
														sceneToAddTo scene: SKScene)
 -> EnemyNode {

		// On first run:
		if old_enemy == nil {
			
			let new_enemy = SKShapeNode()
			scene.addChild(new_enemy)
		
			Tryout() {
			
				// Can this actually work? am I recursion god?
				return	makeNewEnemy(oldEnemy: new_enemy,
														 sceneToAddTo: scene)
			}
		}
	
		// Our return bitch:
		let new_enemy = old_enemy!
	
			// Give it a random color
			findAColor: do {
				
				let random_color = random(1,3)
				
				// Match the color
				switch random_color {
				
				case 1:
					//blue
					new_enemy.fillColor = UIColor.blueColor()
				
				case 2:
					//green
					new_enemy.fillColor = UIColor.greenColor()
				
				case 3:
					//red
					new_enemy.fillColor = UIColor.redColor()
				
				// TODO: Add a unit test for this
				default:
					printError("problem in enemy color pick \(random_color)")
				}
			}
		
			
			// Give it a random position
		findAPosition: do {
			
			// Coords to spawnon (return):
			let 	x : CGFloat?
			let 	y : CGFloat?
			
			let adjusted = (height: scene.frame.height/2,
			                width: scene.frame.width/2)
			
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
