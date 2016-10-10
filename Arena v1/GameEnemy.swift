//
//  File.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/5/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


// Declaration

/// BUllets spawn.. only in a local scope
struct Enemy {
	
	// Vector from / to a point in coord-distance
	typealias MagnitudeXY = (x: CGFloat, y: CGFloat)
	
	// Oop..
	private static var first_run = true
	
	// Explanation... see extension for config
	private let
	radius: CGFloat, 	  					// how big the circle enemy is
	node: SKShapeNode, 					 // what is used to do all the OOP stuff
	difficulty: NSTimeInterval,	// How fast it moves towards teh center
	
	offset: MagnitudeXY, 			// Offsets of bounds (maybe set to .5 of enemy diameter?)
	bounds: MagnitudeXY 		 // Boundaries of the fram
}

// Config
extension Enemy {
	
	/// Config the enemy here... possibly put it in Global.Config.EnemyConfig?
	private init(difficultyLvl difficulty_level: NSTimeInterval,
							 sceneToAddTo scene: SKScene )	{
		
		radius 			= 10
		node 	 			= SKShapeNode.init(circleOfRadius: self.radius)
		difficulty 	= difficulty_level
		
		offset 			= (x: radius/2, y: radius/2)
		bounds 			= (x: ( scene.frame.width - offset.x ),
		       			   y: ( scene.frame.height - offset.x ))
	}
}


// Spawner
extension Enemy {
	
	// Enemy -> member config info -> 
/**
	#### Usage:
	let did_spawn: Bool = enemySpanwer()
	
	#### TODO:
	- add more prams
*/
	static func enemySpawner( sceneToAddTo scene: SKScene,
													  difficultyLvl difficulty: NSTimeInterval
														persistentEnemyNode _G__enemy: SKShapeNode)
		-> DidSucceed {
			
			/// Our enemy instance!!
			let enemy = Enemy.init(difficultyLvl: difficulty, sceneToAddTo: scene)
			
			// Breaking protocol...
			if self.first_run {
				_G__enemy = enemy.node
				scene.addChild(_enems!)
				self.first_run = false
			}
			
			// Give it a color
			findAColor: do {
				let random_color = random(1,3)
				
				// Match the color
				switch random_color {
				case 1:
					//blue
					_enems!.fillColor = UIColor.blueColor()
				case 2:
					//green
					_enems!.fillColor = UIColor.greenColor()
				case 3:
					//red
					_enems!.fillColor = UIColor.redColor()
				default:
					printError("problem in enemy color pick \(random_color)")
					return false	// early exit
				}
			}
		
			
			// Give it a position
			findAPosition: do {
				// 1 top; 2 right; 3 bottom; 4 left
				let side_to_spawn_on = random(1, 4)
				// Coords to spawnon (return):
				let 	x : CGFloat?
				let 	y : CGFloat?

				// set coords:
				switch side_to_spawn_on {
			
				case 1:		// top
					x = random(enemy.offset.x, enemy.bounds.x)  - (0.5 * scene.frame.width)
					y = enemy.bounds.y 													- (0.5 * scene.frame.height)
					
				case 2:		// right
					x = enemy.bounds.x 													- (0.5 * scene.frame.width)
					y = random(enemy.offset.y, enemy.bounds.y)	- (0.5 * scene.frame.height)
					
				case 3:		// bottom
					x = random(enemy.offset.x, enemy.bounds.x) 	- (0.5 * scene.frame.width)
					y = enemy.offset.y													- (0.5 * scene.frame.height)
					
				case 4:		// left
					x = enemy.offset.x 													- (0.5 * scene.frame.width)
					y = random(enemy.offset.y, enemy.bounds.y)	- (0.5 * scene.frame.height)
					
				default:
					printError("problem in randysidepick")
					return false // early exit
				}

				// Set the enemy!
				_enems!.removeAllActions()
				_enems!.runAction(SKAction.moveTo(CGPoint(x: x!, y: y!), duration: 0))
				
				// Run it towards the wheel!
				_enems!.runAction(
					SKAction.moveTo(
						Global.Nodes.central.position, duration: enemy.difficulty))
				
				// No longer the firstrun
				_first_run = false
				
				// No problems :)
				return true
			}
	}
}// EoC
