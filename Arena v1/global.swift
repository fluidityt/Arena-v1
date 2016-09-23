//
//  global.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/2/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

// IDK WHAT THIS IS:
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

// Globals:
struct GameData {
	
 let central : SKNode?
	// get bounds
	// move to bounds
	// use pritns to make sure
	
	// Prev/cur
	var
	firstY: CGFloat = 0,
	prevY: CGFloat = 0,
	curY: CGFloat = 0,
	curA: CGFloat = 0
	
	// Radians:
	let full_circle = 6.281
	
	var
	clock_count = 0,
	seconds = 0
	
	var
	accel = 0,
	accelTime = NSTimeInterval(0)
	
	var	firstDrag = false
	
	
	var
	firstTime: CFTimeInterval=0,
	timeThen: CFTimeInterval=0
	timeNow: CFTimeInterval=0
	
	var
	y1 = CGFloat(0),
	y2 = CGFloat(0),
	y3 = CGFloat(0)
	
	var
	superAngle = CGFloat(0)
}

class F {}




