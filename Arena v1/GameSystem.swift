//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit


class System:
	
	Singleton {	private init() {};	static let this = System()
	
	
	var view = ( scene: SKScene() ,
	             CENTER: CGPoint())
	
	var misc = ( first_move: Bool(),
	             nothing: Bool())
	
	var time = ( current: CFTI(0),
	             stamp: CFTI(0),
	             seconds: Double(0.0),
	             
	             at_this_entry: CFTI(0),
	             at_last_exit: CFTI(0))
	
	
	var angle = (current: CGFloat (),
	             previous: CGFloat (),
	             next: CGFloat ())
	
	// TODO: add typealiases for returning
	var	node = (
		
		wheel: (
			radius: CGFloat(300),
			size: CGFloat(300/2),
			
			speed: (
				min: CGFloat (0.01),
				max: CGFloat (0.4)),
			
			starting:	(
				position: Position.center,
				angle: CGFloat(0)),
			
			funk: (
				updateSize: { return $0 * CGFloat(0.5) })
		),
		
		enemy: (
			radius: CGFloat(),
			move_speed: NSTI(2),
			
			offset: CGPoint(),
			bounds: CGPoint()
		)
	)
	
	var	y = (
		accel:(
			first: CGF (),
			previous: CGF (),
			current: CGF ()),
		
		smoother:	(
			y1: CGF(),
			y2: CGF(),
			y3: CGF())
	)
	
	func testit() {
		var wheel = System.this.node.wheel
		let wf = wheel.funk
		
		wheel.size = wf.updateSize(wheel.radius)
	}
	
	
}//EoC

var sys = System.this






/*
Other way:

class Nodes { private init() {}
var wheel = SKSN()
var enemy = SKShN()

};let nodes = Nodes()

*/






