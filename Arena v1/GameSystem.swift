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
	
	var misc = ( first_move: 	Bool(),
	             score: Int(0),
	             spawn_timer: NSTI(3))
	             
	var time = ( current: CFTI(0),
	             stamp: 	CFTI(0),
	             seconds: Double(0.0),
	             
	             logic: (
								at_this_entry: CFTI(0),
								at_last_exit:  CFTI(0)))
	
	
	var angle = (current: 	CGFloat (),
	             previous:  CGFloat (),
	             next: 			CGFloat ())
	
	
	// TODO: add typealiases for returning
	var	wheel 	=	(	node: 	SKSN(),
	   	         		radius: CGFloat(300),
	   	         		size: 	CGFloat(300/2),
	   	         		
	   	         		speed: (
											min: CGFloat (0.01),
											max: CGFloat (0.4)),
	   	         		
	   	         		starting:	(
											position: CGP( x: gView!.frame.midX,	y: gView!.frame.midY),
											angle: 		CGFloat(0)),
	   	         		
	   	         		funk: (
											updateSize: { return $0 * CGFloat(0.5) },
											empty: {}	))
	
	
	var enemy = (
		node: 			SKShN(),
		
		data: (
			radius: 		CGFloat(30),
			move_speed: NSTI(2),
			offset: 		CGF(5),
			bounds: 		CGPoint(x: gView!.frame.width, y: gView!.frame.height/2),
			
			adjusted: (
				width: gView!.frame.width/2,
				height: gView!.frame.height/2)), // FIXME: supposed to  be /2
		
		funk: (
			
			findColor: { () -> UIColor in
				switch random(1,3) {
				case 1:	return UIColor.blueColor()
				case 2:	return UIColor.greenColor()
				case 3:	return UIColor.redColor()
				default:return UIColor.blackColor()}},
			
			
			findSide: { (e: EnemyData) -> CGPoint in
				let ran_x = random(e.offset, e.bounds.x) - e.adjusted.width
				let ran_y = random(e.offset, e.bounds.y) - e.adjusted.height
				
				switch random(1,4) { // side to spawn on 1 top 4 left
				case 1: return CGP(	x: ran_x,	y: (e.bounds.y - e.adjusted.height)) // top
				case 3: return CGP( x: ran_x, y: (e.offset	- e.adjusted.height))
				case 2: return CGP(	x: (e.bounds.x - e.adjusted.width), y: ran_y)  // bottom
				case 4: return CGP( x: (e.offset - e.adjusted.width),	y: ran_y)
				default: printError("problem in randysidepick"); return CGP(x:0,y:0)}}))
	
	
	// TODO: mirror this for X for portrait mode
	var touch 	= ( z: 0,
	          	    x: 0,
	          	    y: ( // has a TA
										first: CGF (),
										previous: CGF (),
										current: CGF ()))
	
	// TODO: Do I need to enforce type here? 
	var	smoother =	(y1: CGF(), //has  TA
	   	          	 y2: CGF(),
	   	          	 y3: CGF())
	
	var accel = 		( real_jump: 		CGF(),
	            		  strength:			CGF(),
	            		  speed: (
											min: CGF(0.01),
											max: CGF(3.5)))
	
	func testit() {
		var wheel = System.this.wheel
		let wf = wheel.funk
		wheel.size = wf.updateSize(wheel.radius)

	}
	
	
}//EoC


/*
Other way:

class Nodes { private init() {}
var wheel = SKSN()
var enemy = SKShN()

};let nodes = Nodes()

*/






