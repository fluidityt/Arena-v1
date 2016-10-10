//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit

  typealias TimeEntryExit = (at_this_entry: CFTI, at_last_exit: CFTI)


// Base structure:
struct Global: Static {
	func goToMembers() {	seeMembers()	}
	private init() {}
}

// General static stuff:
extension Global {

	// Random shit that doesn't fit anywhere else
	static var
	SELF       = SKScene (),
	
	first_drag = Bool (),
	
	/// Maybe delete this
	time       = (first: CFTimeInterval (),
	              previous: CFTimeInterval (),
	              current: CFTimeInterval ()),
	
	/// Maybe refactor this to time
	time2      = (atBegan: CFTI (), atMove: CFTI (), current: CFTI ())
	
}

// Config:
extension Global {
	/// LET CONSTANTS :d
	struct Config: Singleton {
		
		let
		verbose        = false,
		exec           = false,
		
		real_jump      = CGFloat (20),
		
		accel_strength = CGFloat (0.001),
		speed          = (min: CGFloat (0.01), // The min/max speed is 100/400 PPS
											max: CGFloat (0.4))		// ...which is distance actuall
		
		private init() {}
	}
}

// Nodes:
extension Global {
	/// All of our nodes:
	struct Nodes: Singleton {		private init() {}
		
		var
		wheel = SKSpriteNode(),
		enemy = SKShapeNode()
	}
}

// Angles:
extension Global {
	/// SHould probably move into the wheel category.
	struct Angles {
		
		var
		angle       = (current: CGFloat (),
		               previous: CGFloat (),
		               next: CGFloat ()),
		
		super_angle = CGFloat ()
  
	}
}

// X and Y:
extension Global {
	/// XY should probably be in the smoothing area...
	struct XnY {
		
		typealias XY = Global.XnY
		
		 var
		CENTER_SCREEN = CGPoint (),
		
		// For smoothing FIXME: Make tuple
		y1            = CGFloat (), y2 = CGFloat (), y3 = CGFloat (),
		/// The string, or y_tuple.0 is for INSANITY reasons
		y_tuple       = ("tuple", XY.y1, XY.y2, XY.y3),
		
		y             = (first: CGF (),
		                 previous: CGF (),
		                 current: CGF ())
  ;
	}
}

// Functions:
extension Global {
	/// Cuz I like to get Funcy.. should be used only for the static vars
	struct Funcs: Static {		private init() {}
		
		// TODO: put these in their proper places
		/// Useless but sane functions
		struct Sanity: Static {			private init() {}
			
			/// For sanity reasons of reassigning Gprevy
			static func updatePreviousY (currentY not_current_y: YValue) -> YValue {
				
				return not_current_y
			}
			
			/// for sanity reasons of updatin G currenty
			static func updateCurrentY (new_y_coords: YValue) -> YValue {
			
				return new_y_coords
			}
		}
	}
}


// Members:
extension Global {
	/// Click here to see Global's members
	func seeMembers() {}
	
	// Members:
	static var
	config = Config(),
	nodes = Nodes(),
	angles = Angles(),
	xy = XnY()
}



