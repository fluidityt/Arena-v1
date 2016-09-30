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
		SELF = SKScene(),
		first_drag   = Bool(),
	
		super_angle = CGFloat(),
	
		time = (first: CFTimeInterval(),
						previous: CFTimeInterval(),
						current: CFTimeInterval())
	
	;

	
	struct Nodes {
		
		static var
			central = Circle()
		;
	}
	
	
	struct XnY {
		typealias CGF = CGFloat

		static var
			CENTER_SCREEN = CGPoint(),
		
			// For smoothing FIXME: Make tuple
			y1 = CGFloat(),		y2 = CGFloat(),		y3 = CGFloat(),
			/// The string, or y_tuple.0 is for INSANITY reasons
			y_tuple 	= ("tuple", XY.y1, XY.y2, XY.y3),
			
			y = (first: CGF(),
					 previous: CGF(),
					 current: CGF())
		;
	}
	
	struct Controls {
//		static var
		


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