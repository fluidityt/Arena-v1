//
//  global.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

var error_node = SKNode?()
var verbose = false
var node_list = [SKNode()]
let player = SKSpriteNode()
var SELF = GameScene()

let CENTER_SCREEN = CGPoint(x:CGRectGetMidX(SELF.frame),
                            y:CGRectGetMidY(SELF.frame))
			   