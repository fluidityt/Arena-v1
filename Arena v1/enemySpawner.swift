//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/5/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

extension F {
	
	struct Enemy {
		private init() {}
		
		/**
		#### Usage: 
			let did_spawn = enemySpanwer() // will be true
*/
		static func enemySpawner(sideToSpawnOn side: Int,
														 sceneToAddTo scene: SKScene) -> Bool {
			
			// Size of our enemy (used later too)
			let enemy_radius = CGFloat(10)
			
			// make our toon
			let		enemy 			 = SKShapeNode.init(circleOfRadius: enemy_radius)
			
			// Give it a color
			let random_color = random(1,3)
			
			// Match the color
			switch random_color {
			case 1:
				//blue
				enemy.fillColor = UIColor.blueColor()
			case 2:
				//green
				enemy.fillColor = UIColor.greenColor()
			case 3:
				//red
				enemy.fillColor = UIColor.redColor()
			default:
				()
			}
			
			// 1 top 2 right 3 bottom 4 left
			func spawnSideDecider() -> Int {
				return randy(4)
			}
			
			// TODO: do this right with a decent random method
			/// 1 top; 2 right; 3 bottom; 4 left
			func randomPosition( spawnOnSide side: Int = side,
													 enemyRadius radius: CGFloat = enemy_radius)
				
				-> CGPoint {
					
					// Offsets of bounds (maybe set to .5 of enemy diameter?)
					// TODO: Move this to config file?
					let
					x_offset = radius * 0.5,
					y_offset = radius * 0.5
					
					// Boundaries of the fram
					// TODO: subtract the offset from the bounds
					let
					x_bounds = (Global.SELF.frame.width - x_offset),
					y_bounds = (Global.SELF.frame.height - y_offset)
					
					// Coords to spawn:
					let
					x : CGFloat?,
					y : CGFloat?
					
					// set coords:
					switch side {
					case 1:		// top
						x = random(x_offset, x_bounds)
						y = y_bounds
					case 2:		// right
						x = x_bounds
						y = random(y_offset, y_bounds)
					case 3:		// bottom
						x = random(x_offset, x_bounds)
						y = y_offset
					case 4:		// left
						x = x_offset
						y = random(y_offset, y_bounds)
					default:
						printl("problem in randysidepick")
						x = 99999; y = 0
					}
					
					return CGPoint(x: x!, y: y!)
			}
			
			
			// do stuff
			enemy.position = randomPosition(spawnOnSide: side, enemyRadius: enemy_radius)
			
			// Error check:
			guard (enemy.position.x != 99999) else {	return false		}
			
			// on success:
			scene.addChild(enemy)
			
			// more stuff
			enemy.runAction(SKAction.moveTo(Global.Nodes.central.position, duration: 3))
			
		}
	}
}
