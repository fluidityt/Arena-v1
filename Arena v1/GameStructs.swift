//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit

typealias CFTI = CFTimeInterval
typealias CGF = CGFloat
typealias YValue = CGFloat // Cause we use it a lot

typealias TimeEntryExit = (at_this_entry: CFTI, at_last_exit: CFTI)

struct Global: Static {

  /// LET CONSTANTS :d
  struct Config: Static {
    static let
    verbose        = false,
    exec           = false,

    real_jump      = CGFloat (20),

    accel_strength = CGFloat (0.001),
    speed          = (min: CGFloat (0.01), // The min/max speed is 100/400 PPS
                      max: CGFloat (0.4))
    // ...which is distance actuall
  }

  /* Random shit that doesn't
  fit anywhere else */
  static var
  SELF       = SKScene (),
  first_drag = Bool (),

  /// Maybe delete this
  time       = (first: CFTimeInterval (),
                previous: CFTimeInterval (),
                current: CFTimeInterval ()),

  /// Maybe refactor this to time
  time2      = (atBegan: CFTI (), atMove: CFTI (), current: CFTI ()),
	
	time3			 = (at_this_entry: CFTI(), at_last_exit: CFTI())
;

  struct Nodes: Static {

    static var
    central = Circle ()
  ;
  }

  struct Angles: Static {
    static var
    angle       = (current: CGFloat (),
                   previous: CGFloat (),
                   next: CGFloat ()),

    super_angle = CGFloat ()
  ;
  }

  struct XnY: Static {

    typealias XY = Global.XnY

    static var
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

  /// Cuz I like to get Funcy
  struct Funcs: Static {

    /// Useless but sane functions
    struct Sanity: Static {

      /// For sanity reasons of reassigning Gprevy
      static func updatePreviousY (currentY not_current_y: YValue) -> YValue {

        return not_current_y
      }
			
			static func updatePreviousAngle (nextAngle next_angle: CGFloat) -> CGFloat {
				
				return next_angle
			}

      /// for sanity reasons of updatin G currenty
      static func updateCurrentY (new_y_coords: YValue) -> YValue {

        return new_y_coords
      }
    }
  }
}


//
//  structs.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/30/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//


import SpriteKit

struct Global2: Static {
	
	// FIXME: repeats
	typealias CFTI = CFTimeInterval
	typealias CGF = CGFloat
	typealias YValue = CGFloat // Cause we use it a lot
	
	
	/// LET CONSTANTS :d
	struct Config {
		 let
		verbose        = false,
		exec           = false,
		
		real_jump      = CGFloat (20),
		
		accel_strength = CGFloat (0.001),
		speed          = (min: CGFloat (0.01), // The min/max speed is 100/400 PPS
			max: CGFloat (0.4))
		// ...which is distance actuall
	}
	
	struct General {
	/* Random shit that doesn't
	fit anywhere else */
	 var
	SELF       = SKScene (),
	first_drag = Bool (),
	
	/// Maybe delete this
	time       = (first: CFTimeInterval (),
	              previous: CFTimeInterval (),
	              current: CFTimeInterval ()),
	
	/// Maybe refactor this to time
	time2      = (atBegan: CFTI (), atMove: CFTI (), current: CFTI ())
	;
	}
	struct Nodes {
		
		 var
		central = Circle ()
  ;
	}
	
	struct Angles {
		var
		angle       = (current: CGFloat (),
		               previous: CGFloat (),
		               next: CGFloat ()),
		
		super_angle = CGFloat ()
  ;
	}
	
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
	
	
	// Members:
	static var
	config = Config(),
	general = General(),
	nodes = Nodes(),
	angles = Angles(),
	xy = XnY()
	
	
	/// Cuz I like to get Funcy
	struct Funcs: Static {
		
		/// Useless but sane functions
		struct Sanity: Static {
			
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





