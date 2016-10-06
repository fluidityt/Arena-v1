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
			
			XY.CENTER_SCREEN = CGPoint (x: CGRectGetMidX (G.SELF.frame),
										y: CGRectGetMidY (G.SELF.frame))
		}

		initCircles:do {

			Global.Nodes.central = Circle ()
			G.SELF.addChild (N.central)

			N.central.runAction (SKAction.rotateToAngle (0, duration: 0.5))
			G.Angles.angle.current = N.central.zRotation
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
		if G.first_drag == true {

			G.first_drag = false    // This has to be false after first_entry

			G.time.previous = G.time.first // time.atTB compared with time.atMove
		}
				
				
		for touch in touches {

			updateGlobesWithNewTouchInfo:do {

				XY.y.previous = Sanity.updatePreviousY (currentY: XY.y.current)
				XY.y.current  = Sanity.updateCurrentY  (touch.locationInNode (self).y)
			}


			// Paused (lateral)--no angle now--reset values
			guard (XY.y.current != XY.y.previous) else {

				printl ("paused but didn't release")
				N.central.removeAllActions ()
				XY.y_tuple = ("refreshed", 0, 0, 0)

				return // From guard
			}

			
			let fully_handled_rotation_action_with_acceleration_and_smoothing
			= findRotationAction (XY.y.current)
			

			runFoundAction:do {
				N.central.runAction (fully_handled_rotation_action_with_acceleration_and_smoothing)
			}
		}
		
		return // From TM
	}

	override func touchesEnded (touches: Set<UITouch>, withEvent event: UIEvent?) {

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
        
		G.time.current = currentTime
		return // from update
	}
}//EoC

func shapeTex (node: SKShapeNode) {

	node.fillColor = UIColor.whiteColor ()
	node.fillTexture = SKTexture.init (image: UIImage (named: "twistycenter")!)
}

