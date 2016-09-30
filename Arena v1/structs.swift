//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit

struct Global {
	
	/* Random shit that doesn't
	fit anywhere else */
	static var
	
	SELF = SKScene()

	
	struct Nodes {
		static var
		
		central = Circle()
	}
	
	
	struct XnY {
		static var
		
		CENTER_SCREEN = CGPoint(),
		super_angle = CGFloat(),
		
		// For smoothing
		y1 = CGFloat(),
		y2 = CGFloat(),
		y3 = CGFloat(),
		
		
		first_y 		 = CGFloat(),
		prev_y = CGFloat(),
		cur_y = CGFloat()
		
	}
	
	struct Controls {
		static var
		
		first_drag   = Bool(),
		first_time = CFTimeInterval(),

		time_now	= CFTimeInterval(),
		
		time_then = CFTimeInterval(),
		/// The string, or y_tuple.0 is for INSANITY reasons
		y_tuple 	= ("tuple", XY.y1, XY.y2, XY.y3)
	}
	
	struct Wheel {
		static var
		
		cur_angle = CGFloat()
	}
}

typealias G = Global
typealias N = G.Nodes
typealias XY = G.XnY
typealias C = G.Controls
typealias W = G.Wheel