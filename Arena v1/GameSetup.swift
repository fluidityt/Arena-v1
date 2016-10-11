//
//  GameSetup.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/11/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

// Aliases
typealias TimeEntryExit = (at_this_entry: CFTI, at_last_exit: CFTI)

//typealias Wheelz = (node: SKSN, radius: CGFloat, size: CGFloat, speed: (min: CGFloat, max: CGFloat), starting: (position: Position, angle: CGFloat), funk: (updateSize: (CGFloat) -> CGFloat))
// Data
let sys = System.this
var gView: SKView?


// Enum
enum MyScene { case game_scene }

typealias Enemy = (node: Arena_v1.SKShN, radius: CGFloat, move_speed: Arena_v1.NSTI, offset: CGPoint, bounds: CGPoint)


