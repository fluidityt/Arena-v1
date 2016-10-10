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

	
	// Random shit that doesn't fit anywhere else
	static var SELF       = SKScene ()
	
	static var first_drag = Bool ()

	static var time = ( current: CFTI(0),
	                    stamp: CFTI(0),
	                    seconds: Double(0.0),
	                    at_this_entry: CFTI(0),
	                    at_last_exit: CFTI(0))
	
	static var angle = ( current: CGFloat (),
	                     previous: CGFloat (),
	                     next: CGFloat ())



	struct Nodes: Singleton {		private init() {}
		
		var
		wheel = Wheel(sceneName: Global.SELF),
		enemy = Enemy(sceneToAddTo: Global.SELF)
	}



	/// XY should probably be in the smoothing area...
	struct XnY {
		
		typealias XY = Global.XnY
		
		var center_screen = CGPoint ()
		
		// For smoothing FIXME: Make tuple
		var		y1 = CGFloat (),
					y2 = CGFloat (),
					y3 = CGFloat ()
		
		/// The string, or y_tuple.0 is for INSANITY reasons
		var	y_tuple = ("tuple", CGF(), CGF(), CGF())
		
		var	y = (first: CGF (),
		   	     previous: CGF (),
		   	     current: CGF ())
  
	}



	/// Cuz I like to get Funcy.. should be used only for the static vars
	struct Funcs: Static {		private init() {}
		
		// TODO: put these in their proper places
		/// Useless but sane functions
		struct Sanity: Static {			private init() {}
			
			/// For sanity reasons of reassigning Gprevy
			static func updatePreviousY (currentY not_current_y: CoordY) -> CoordY {
				
				return not_current_y
			}
			
			/// for sanity reasons of updatin G currenty
			static func updateCurrentY (new_y_coords: CoordY) -> CoordY {
				
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
	nodes = Nodes(),
	xy = XnY()
}



