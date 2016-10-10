////
////  newFunc.swift
////  Arena v1
////
////  Created by Dude Guy  on 9/23/16.
////  Copyright © 2016 Dude Guy . All rights reserved.
////
//
//import Foundation
//
//
//typealias SP = SharedPrefs
//
//
//var _system_file = SavedVariables()
//
//let SELF: GameScene?
//let CENTER_SCREEN: CGPoint?
//
//
///// NO INSTANCES
//protocol Static {
//	// init(noInstances: Static)
//}
//
//protocol Singleton {}


/*

struct Global: Static {

/// LET CONSTANTS :d
struct Config: Static {
static let
verbose        = false,
exec           = false,

real_jump      = CGFloat (2),

accel_strength = CGFloat (0.001),
speed          = (min: CGFloat (0.005), // The min/max speed is 100/400 PPS
max: CGFloat (0.3)),

// TODO: These should probably be var...
spawn_timer		 = 2,
difficulty 		 = NSTimeInterval(2.5)
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
central = SKSpriteNode ()
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
static func updatePµ

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
*/