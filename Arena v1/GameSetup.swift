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
typealias Enemy = (node: Arena_v1.SKShN, radius: CGFloat, move_speed: Arena_v1.NSTI, offset: CGPoint, bounds: CGPoint, adjusted: (height: CGFloat, width: CGFloat), funk: (findColor: () -> UIColor, empty: () -> ()))


// Vars:
/// Used for EVERYTHING... Make sure to stay procedural and safe!
let sys = System.this

/// Don't forget to unwrap!
var gView: SKView?




