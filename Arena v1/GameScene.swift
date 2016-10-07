//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global

import SpriteKit


/// Its ok to have a singular globe that isn't funcy... right? it's thread independent
var _current_time = CFTimeInterval()

typealias PrivateInit = Void

struct Note {
	
	init(code: ()->()) {
		code()
	}
	
}
struct DontRun {
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
func notafunc_conventions () {

/*

func purFunc(mat:Void) -> String {
	stuff()
}
;
something = purFunc(d)
;
	
	DONT I NEED TO FIGURE OUT A WAY TO GET PRAMS MORE EASILY DISTINCT?
*/
}


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

			Global.Nodes.central = Circle ()
			
			let central_node = G.Nodes.central
			Global.SELF.addChild (central_node)

			Global.Nodes.central.runAction (SKAction.rotateToAngle (0, duration: 0.5))
			
			let central_rotation = G.Nodes.central.zRotation
			Global.Angles.angle.current = central_rotation
		}
		return // from DMtV
	}


	override func touchesBegan (touches: Set<UITouch>, withEvent event: UIEvent?) {

		for touch in touches {

			old: do {
//			Hotfix() {
//			// The time NOW (basically) when started TB
//				//Global.time2.atBegan = G.time.current
//			}
			}
			
			// The next input (TM) will be our 'first drag' | error checking is good!
			Global.first_drag == false ? G.first_drag = true : printd ("first drag was f\\ked")

			// Where we just clicked is our new y.current
			Global.XnY.y.current = Sanity.updateCurrentY (touch.locationInNode (self).y)
			
		
		}


		return // from TB
	}


	override func touchesMoved (touches: Set<UITouch>, withEvent event: UIEvent?) {

		handleFirstEntry: do {
			// TODO: Figure out the timing problem (hold TB then 5 sec later TM will minspeed
			
		if Global.first_drag == true {

			Global.first_drag = false    // This has to be false after first_entry

			let time_first = G.time.first
			Global.time.previous = time_first // time.atTB compared with time.atMove
			}
		}
				
		// Main entry:
		for touch in touches {

			// Update the globes with the new touch and time info
			do {
				
				// Y values are different now:
				Global.XnY.y.previous = Sanity.updatePreviousY (currentY: G.XnY.y.current)
				Global.XnY.y.current  = Sanity.updateCurrentY  (touch.locationInNode (self).y)
			}


			// Handle the case where we need to pause...
			// Lateral--no angle now--reset values
			Tryout { do {

				guard (G.XnY.y.current != G.XnY.y.previous) else {
					printl ("paused but didn't release")
					
					// Reset values
					Global.Nodes.central.removeAllActions ()
					Global.XnY.y_tuple = ("refreshed", 0, 0, 0)
					
					return
				}}
			}
			
			// Update our timer (start)
			Tryout {
				// Timing values for the acceleration pipeline:
				Global.time3.at_this_entry = _current_time
			}
			
			// If no lateral movement, let's find our rotation action:
			let fully_handled_rotation_action_with_acceleration_and_smoothing
				= FindRotationAction.implement1thru7(globalYTuple: 				&G.XnY.y_tuple,
				                                     globalCurrentY: 			&G.XnY.y.current,
				                                     globalPreviousY: 		G.XnY.y.previous,
				                                     globalYFirstPrev: 		G.XnY.y,
				                                     globalRealJump: 			G.Config.real_jump,

				                                     globalTimeEE:				G.time3,
			                                     
				                                     globalAccelSlider: 	G.Config.accel_strength,
				                                     globalSpeedMinMax: 	G.Config.speed,
				                                     globalCurrentAngle:	G.Angles.angle.current,
				                                     globalNextAngle: 		&G.Angles.angle.next)
			

			// Update our timer (exit)
			Tryout {
				// timing value for accel
				Global.time3.at_last_exit = _current_time
			}
			
			// Run the found rotation action
			do {
				// Rotate to the nextAngle
				N.central.runAction (fully_handled_rotation_action_with_acceleration_and_smoothing)
				
				// Our current angle is now something else to be something different
				Global.Angles.angle.current
					= Sanity.updatePreviousAngle(nextAngle: G.Angles.angle.next)
			}
		}
		
		return // From TM
	}

	override func touchesEnded (touches: Set<UITouch>, withEvent event: UIEvent?) {
		Global2.xy.y_tuple = ("refreshed", 0, 0, 0)
		XY.y_tuple = ("refreshed", 0, 0, 0)
	}


	override func update (currentTime: CFTimeInterval) {

		updateClock:do {
			/*
			// Clocker...
			_clock_count += 1

			// Seconder...
			if _clock_count == 60 {

			  _clock_count = 0
			  _seconds += 1
			}

			// Spawner...
			if _seconds == 3 {

			  enemySpawner()
			  _seconds = 0
			 }
			*/
        }
		// Breaking procedure for something that should be built in
		_current_time = currentTime
		return // from update
	}
}//EoC

func shapeTex (node: SKShapeNode) {

	node.fillColor = UIColor.whiteColor ()
	node.fillTexture = SKTexture.init (image: UIImage (named: "twistycenter")!)
}

