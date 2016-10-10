//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global

import SpriteKit



// MARK: Top
// MARK: Move to other file
/// Its ok to have a singular globe that isn't funcy... right? it's thread independent
var _current_time = CFTimeInterval(0)
var _time_stamp = CFTI(0)
var _seconds = 0

typealias PrivateInit = Void
struct Note {
	
	init(code: ()->()) {
		code()
	}
	
}
struct DontRun {
	init(code: ()->()) {}
}
struct Backup {
	init(code: ()->()) {}
}

struct Placeholder {
	
	init(code: ()->()) {
		code()
	}
	
}
struct Tryout {
	
	
	init(code: ()->()) {
		code()
	}
	
}
struct NeedsWork {
	
	init(code: ()->()) {
		code()
	}
	
}

/// Can't force a `private init() {}` ={
protocol Static {}

/* Shortcuts */
typealias G = Global
typealias N = G.Nodes
typealias A = G.Angles
typealias XY = G.XnY

typealias Sanity = G.Funcs.Sanity

// Typealias

// MARK: Top:
/// My game lol
class GameScene: SKScene {

	override func didMoveToView (view: SKView) {

		genericInits:do {
			
			Global.SELF = self
			Global.first_drag = false // Confusing
			
			let frame = Global.SELF.frame
			XY.CENTER_SCREEN = CGPoint (x: CGRectGetMidX (frame),
																	y: CGRectGetMidY (frame))
		}

		initCircles:do {
			
			
		
			
			// Supra!
			Global.Nodes.central = self.childNodeWithName("bigger") as! SKSpriteNode
			N.central.size = CGSize(width: 300, height: 300)
			N.central.position = Global.XnY.CENTER_SCREEN
			N.central.runAction (SKAction.rotateToAngle (0, duration: 0.5))
		
			let central_rotation = G.Nodes.central.zRotation
			Global.Angles.angle.current = central_rotation
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
			printd ("first drag was f\\ked") // alert to logic error
		}
		
		// Where we just clicked is our new y.current
		Global.XnY.y.current = touches.first!.locationInNode (self).y
		
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
				Global.XnY.y.previous = Sanity.updatePreviousY (currentY: G.XnY.y.current)
				Global.XnY.y.current  = Sanity.updateCurrentY  (touch.locationInNode (self).y)
			}

			// Handle the case where we need to pause... Lateral--no angle now--reset values
			guardLateral: do {
				
				guard (G.XnY.y.current != G.XnY.y.previous) else {
					printd ("paused but didn't release")
					
					// Reset values
					Global.Nodes.central.removeAllActions ()
					Global.XnY.y_tuple = ("refreshed", 0, 0, 0)
					
					return
					
				}
			}
			
			// Find rotation action
			doRotation: do {
				
				// Update our timer (start)
				Global.time3.at_this_entry = _current_time
				
				// If no lateral movement, let's find our rotation action:
				let fully_handled_rotation_action_with_acceleration_and_smoothing
					= FindRotationAction.implement1thru7(
						globalYTuple: 				&G.XnY.y_tuple,
						globalCurrentY: 			&G.XnY.y.current,
						globalPreviousY: 			G.XnY.y.previous,
						globalYFirstPrev: 		G.XnY.y,
						globalRealJump: 			G.Config.real_jump,
						
						globalTimeEE:					G.time3,
						
						globalAccelSlider: 		G.Config.accel_strength,
						globalSpeedMinMax: 		G.Config.speed,
						globalCurrentAngle:		G.Angles.angle.current,
						globalNextAngle: 			&G.Angles.angle.next)
				
				// Update our timer (exit)
				Global.time3.at_last_exit = _current_time

				// Rotate to the nextAngle
				N.central.runAction (fully_handled_rotation_action_with_acceleration_and_smoothing)
				
				// Our current angle is now something else to be something different
				Global.angles.angle.current
					= <-Global.Funcs.Sanity.updatePreviousAngle(nextAngle: G.Angles.angle.next)
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

		handleFirstRun: do {
			if _current_time == 0 {
				_current_time = currentTime
				_time_stamp = currentTime
			}
		}
		
		_current_time = currentTime
		
		Tryout {
			// If one second has passed since last timestamp..
			if _current_time >= (_time_stamp + 1) {
				// Then increase seconds, and set stamp to current time
				_seconds += 1
				_time_stamp = _current_time
			}
			
			// Check for enemy spawn..
			if _seconds == Global.config.spawn_timer {
				// Spawn enemy
				
				Enemy.enemySpawner(sceneToAddTo: <-Global.SELF,
													 difficultyLvl: <-Global.config.difficulty)
				
				// Reset timer for next enemy
				_seconds = 0
	 		}
		}

		return // from update
	}

}//EoC

func shapeTex (node: SKShapeNode) {

	node.fillColor = UIColor.whiteColor ()
	node.fillTexture = SKTexture.init (image: UIImage (named: "twistycenter")!)
}
// MARK: Bottom
