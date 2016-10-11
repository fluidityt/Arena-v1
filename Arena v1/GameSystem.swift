//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit


// Base structure:
class System: Singleton {
	
	var view = ( scene: SKScene() ,
	            CENTER: CGPoint())
	
	var misc = ( first_move: Bool(),
							 nothing: Bool())
	
	var time = ( current: CFTI(0),
	             stamp: CFTI(0),
	             seconds: Double(0.0),
	
	             at_this_entry: CFTI(0),
	             at_last_exit: CFTI(0))
	
	
	var angle = ( current: CGFloat (),
	              previous: CGFloat (),
	              next: CGFloat ())
	
	var	nodes = ( wheel: SKSN(),
							 enemy: SKShN())

	var	y = ( accel:
									(first: CGF (), previous: CGF (), current: CGF ()),
				    smoother:
									("tuple", CGF(), CGF(), CGF()) )
	
	/// Call at didMoveToView()
	func initializeWithScene(scene: SKScene) {
		self.view.scene = scene
		self.view.CENTER = setPosition(Position.center, scene: scene)
		
		self.nodes.wheel = Wheel.makeNewWheel(sceneName: scene)
		self.nodes.enemy = Enemy.makeNewEnemy(sceneToAddTo: scene)
		
	}
}

/*
Other way:

class Nodes { private init() {}
	var wheel = SKSN()
	var enemy = SKShN()

};let nodes = Nodes()

*/






