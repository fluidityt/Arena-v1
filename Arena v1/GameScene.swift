//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

import SpriteKit

					// MARK: Top:


/// My game lol
class GameScene: SKScene {

	override func didMoveToView (view: SKView) {

		// Init basic vars:
		gView = view
		
		// Logic stuff:
		sys.misc.first_move = false
		sys.angle.current = 0
		
		// Init wheel:
		sys.wheel.node = self.childNodeWithName("bigger") as! SKSpriteNode
		let wn = sys.wheel.node
		
		wn.size = CGSize(width: 300, height: 300)
		wn.position = CGPoint(x: (gView?.frame.midX)!, y: (gView?.frame.midY)!)
		wn.runAction(SKAction.rotateToAngle(sys.angle.current, duration: 0.5))
	}
	

	override func touchesBegan (touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		// The next input (TM) will be our 'first drag' | error checking is good!
		if sys.misc.first_move == false {
			sys.misc.first_move = true // correct msitake
			printError ("first drag was f\\ked")
		}
		
		// Where we just clicked is our new y.current
		sys.touch.y.current = touches.first!.locationInNode (self).y
	}


	override func touchesMoved (touches: Set<UITouch>, withEvent event: UIEvent?) {

		// First entry (that is, first TM of however long series before TE) - special stuff
		// TODO: Figure out the timing problem (hold TB then 5 sec later TM will minspeed
		// first_move has to be false after the initial touchesMoved
		if sys.misc.first_move == true {
			sys.misc.first_move = false
		}
		
		// Main entry:
		/* Update Globes -> Update Timer -> Find Rotation Action -> Timer -> Run */
		for touch in touches {
			
			// Update the globes with the new touch and time info:
			sys.touch.y.previous = sys.touch.y.current
			sys.touch.y.current  = touch.locationInNode(self).y
			
			
			// Handle the case where we need to pause... Lateral--no angle now--reset values:
			if (sys.touch.y.current == sys.touch.y.previous) {
				printError ("paused but didn't release")
				
				// Reset values
				Note(note: "I think that the type on smoother is wrong, and continue may not")
				sys.wheel.node.removeAllActions ()
				sys.smoother = (0, 0, 0)
				continue
			}
		
			// Find rotation action:
			doRotation: do {
				
				// Update our timer (start)
				sys.time.logic.at_this_entry = sys.time.current
				
				// If no lateral movement, let's find our rotation action:
				let returned_vals
					= FindRotationAction.implement1thru7(
						globalYTuple: 				sys.smoother,
						globalCurrentY: 			sys.touch.y.current,
						globalPreviousY: 			sys.touch.y.previous,
						globalYFirstPrev: 		sys.touch.y,
						globalRealJump: 			sys.accel.real_jump,
						
						globalTimeEE:					sys.time.logic,
						
						globalAccelSlider: 		sys.accel.strength,
						globalSpeedMinMax: 		sys.accel.speed,
						globalCurrentAngle:		sys.angle.current,
						globalNextAngle: 			sys.angle.next)
				
				// Update our timer (exit)
				sys.time.logic.at_last_exit = sys.time.current
				
				// Update globes:
				sys.touch.y.current 		= returned_vals.finished_y
				sys.smoother 						= returned_vals.finished_smoother
				sys.angle.current				=	returned_vals.finished_angle
				
				// FINALLY::: run the action (rotate!) TODO: Try putting this in update()
				sys.wheel.node.runAction( returned_vals.finished_action )
			}
		}
	}

	
	override func touchesEnded (touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		// ALl of these *should* be unnecessary... esp w func programming...
		// Maybe.. put all of the non-var needed data in a new object at start of TM?
		resetEverything: do {
			
			sys.touch.y.current = 0				// What harm could this do?
			sys.misc.first_move = true		// Resets for TB entry
			sys.smoother = (0, 0, 0)			// Reset our smoother
			
			sys.angle.next = 0	// No crazy angles
		}
	}

	
	override func update (currentTime: CFTimeInterval) {
		
		if sys.time.current == 0 {		sys.time.stamp  = currentTime		}
		
		sys.time.current = currentTime
	
		// If one second has passed since last timestamp..
		if sys.time.current >= (sys.time.stamp + 1) {
			// Then increase seconds, and set stamp to current time
			sys.time.seconds 		+= 1
			sys.time.stamp = sys.time.current
		}
		
		// Check for enemy spawn..
		if sys.time.seconds >= sys.misc.spawn_timer {
			
			sys.enemy.nodeGlobal.nodes.enemy = Enemy()		// Spawn enemy
			
			// Run it towards the wheel!
			let attack_circle = SKAction.moveTo(Global.nodes.wheel,
			                                    duration: ConfigFile.difficulty)
			
			OOP --> runAction( attack_circle, on: Global.nodes.wheel)
			
			time.seconds = 0	// Reset timer for next enemy
		}
		
		
		return // from update
	}

}//EoC

func shapeTex (node: SKShapeNode) {

	node.fillColor = UIColor.whiteColor ()
	node.fillTexture = SKTexture.init (image: UIImage (named: "twistycenter")!)
}
// MARK: Bottom
