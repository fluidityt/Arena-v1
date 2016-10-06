//
//  GameScene.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright (c) 2016 Dude Guy . All rights reserved.

// _ means global

import SpriteKit



// fun
protocol Static {
}

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

			// The time NOW (basically) when started TB
			Global.time2.atBegan = G.time.current

			// The next input (TM) will be our 'first drag' | error checking is good!
			Global.first_drag == false ? G.first_drag = true : printd ("first drag was f\\ked")

			// Where we just clicked is our new y.current
			Global.XnY.y.current = Sanity.updateCurrentY (touch.locationInNode (self).y)
		}


		return // from TB
	}


	override func touchesMoved (touches: Set<UITouch>, withEvent event: UIEvent?) {

		// Shouldnt this be outside for loop..
		let first_drag = G.first_drag
		if first_drag == true {

			Global.first_drag = false    // This has to be false after first_entry

			let time_first = G.time.first
			Global.time.previous = time_first // time.atTB compared with time.atMove
		}
				
				
		for touch in touches {

			updateGlobesWithNewTouchInfo:do {
				
				let y_current = G.XnY.y.current
				
				Global.XnY.y.previous = Sanity.updatePreviousY (currentY: y_current)
				Global.XnY.y.current  = Sanity.updateCurrentY  (touch.locationInNode (self).y)
			}


			// Paused (lateral)--no angle now--reset values
			let y_current = G.XnY.y.current
			let y_previous = G.XnY.y.previous
			
			guard (y_current != y_previous) else {

				printl ("paused but didn't release")
				
				Global.Nodes.central.removeAllActions ()
				Global.XnY.y_tuple = ("refreshed", 0, 0, 0)

				return // From guard
			}

			let fully_handled_rotation_action_with_acceleration_and_smoothing
			= findRotationAction (y_current)
			

			runFoundAction:do {
				N.central.runAction (fully_handled_rotation_action_with_acceleration_and_smoothing)
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
        
		Global.time.current = currentTime
		return // from update
	}
}//EoC

func shapeTex (node: SKShapeNode) {

	node.fillColor = UIColor.whiteColor ()
	node.fillTexture = SKTexture.init (image: UIImage (named: "twistycenter")!)
}

