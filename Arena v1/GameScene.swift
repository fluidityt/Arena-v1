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

		genericInits:do {
			
			Global.SELF = self
			Global.first_drag = false // Confusing
			
			Global.xy.CENTER_SCREEN = <-Global.SELF.frame
		}

		initCircles:do {
			
			// Supra!
			Global.nodes.wheel = self.childNodeWithName("bigger") as! SKSpriteNode
			N.wheel.size = CGSize(width: 300, height: 300)
			N.wheel.position = Global.xy.CENTER_SCREEN
			N.wheel.runAction (SKAction.rotateToangle (0, duration: 0.5))
		
			let wheel_rotation = G.nodes.wheel.zRotation
			Global.angles.angle.current = wheel_rotation
		}
		return // from DMtV
	}


	override func touchesBegan (touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		// The next input (TM) will be our 'first drag' | error checking is good!
		if Global.first_drag == true {
			// All is well :)
		}
		else {
			Global.first_drag = true // correct msitake
			printError ("first drag was f\\ked") // alert to logic error
		}
		
		// Where we just clicked is our new y.current
		Global.xy.y.current = touches.first!.locationInNode (self).y
		
		return // from TB
	}


	override func touchesMoved (touches: Set<UITouch>, withEvent event: UIEvent?) {

		// First entry (that is, first TM of however long series before TE) - special stuff
		// TODO: Figure out the timing problem (hold TB then 5 sec later TM will minspeed
		handleFirstEntry: do {
			
			if Global.first_drag == true {
				
				Global.first_drag = false    // This has to be false after first_entry
				
				let time_first = G.time.first
				Global.time.previous = time_first // time.atTB compared with time.atMove
			}
		}
		
		
		// Main entry: Update Globes -> Update Timer -> Find Rotation Action -> Timer -> Run
		for touch in touches {

			// Update the globes with the new touch and time info
			updateGlobes: do {
				
				// Y values are different now:
				Global.xy.y.previous = Sanity.updatePreviousY (currentY: G.xy.y.current)
				Global.xy.y.current  = Sanity.updateCurrentY  (touch.locationInNode (self).y)
			}

			// Handle the case where we need to pause... Lateral--no angle now--reset values
			guardLateral: do {
				
				guard (G.xy.y.current != G.xy.y.previous) else {
					printError ("paused but didn't release")
					
					// Reset values
					Global.nodes.wheel.removeAllActions ()
					Global.xy.y_tuple = ("refreshed", 0, 0, 0)
					
					return
					
				}
			}
			
			// Find rotation action
			doRotation: do {
				
				// Update our timer (start)
				time.at_this_entry = time.current
				
				// If no lateral movement, let's find our rotation action:
				let fully_handled_rotation_action_with_acceleration_and_smoothing
					= FindRotationAction.implement1thru7(
						globalYTuple: 				&G.xy.y_tuple,
						globalCurrentY: 			&G.xy.y.current,
						globalPreviousY: 			G.xy.y.previous,
						globalYFirstPrev: 		G.xy.y,
						globalRealJump: 			G.Config.real_jump,
						
						globalTimeEE:					G.time3,
						
						globalAccelSlider: 		G.Config.accel_strength,
						globalSpeedMinMax: 		G.Config.speed,
						globalCurrentAngle:		G.angles.angle.current,
						globalNextAngle: 			&G.angles.angle.next)
				
				// Update our timer (exit)
				time.at_last_exit = time.current

				// Rotate to the nextangle
				N.wheel.runAction (fully_handled_rotation_action_with_acceleration_and_smoothing)
				
				// Our current angle is now something else to be something different
				Global.angles.angle.current	= <-Global.angles.angle.next
			}
		}
		
		return // From TM
	}

	
	override func touchesEnded (touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		// ALl of these *should* be unnecessary... esp w func programming...
		// Maybe.. put all of the non-var needed data in a new object at start of TM?
		resetEverything: do {
			
				// What harm could this do?
				Global.xy.y.current = 0
				
				// Resets for TB entry
				Global.first_drag = true
				
				// Reset our smoother
				XY.y_tuple = ("refreshed", 0, 0, 0)
			
				// No crazy angles
			Global.angles.angle.next = 0
		}
	}



	
	override func update (currentTime: CFTimeInterval) {
		
		if time.current == 0 {		time.stamp  = currentTime		}
		
		time.current = currentTime
	
		// If one second has passed since last timestamp..
		if time.current >= (time.stamp + 1) {
			// Then increase seconds, and set stamp to current time
			time.seconds 		+= 1
			time.stamp = time.current
		}
		
		// Check for enemy spawn..
		if time.seconds >= ConfigFile.spawn_timer {
			
			Global.nodes.enemy = Enemy()		// Spawn enemy
			
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
