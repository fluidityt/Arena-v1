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

var exec = true

let CENTER_SCREEN = CGPoint(x:CGRectGetMidX(SELF.frame),
                            y:CGRectGetMidY(SELF.frame))

func getCenter(node:SKNode) -> CGPoint {
	return (CGPoint(x:CGRectGetMidX(node.frame),
	        y:CGRectGetMidY(node.frame)))
}


var _central : SKNode?
// get bounds
// move to bounds
// use pritns to make sure


var
		_firstY: CGFloat = 0, _prevY: CGFloat = 0,	_curY: CGFloat = 0, _curA: CGFloat = 0

let _full_circle = 6.281

var
		_clock_count = 0, _seconds = 0

var _accel = 0, _accelTime = NSTimeInterval(0)

var _firstDrag = false


var
		_firstTime: CFTimeInterval=0, _timeThen: CFTimeInterval=0, _timeNow: CFTimeInterval=0

var
		y1 = CGFloat(0), y2 = CGFloat(0), y3 = CGFloat(0)

var
		_superAngle = CGFloat(0)


