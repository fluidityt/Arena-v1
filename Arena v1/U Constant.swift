//
//  U Alias.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit
										/* MARK: Aliases */
// General:
typealias Block = ()->()

// Name shorters:
typealias SKSN = SKSpriteNode
typealias SKShN = SKShapeNode
typealias CGF	 = CGFloat
typealias CGP = CGPoint
typealias CFTI = CFTimeInterval
typealias NSTI = NSTimeInterval

// Describers:
typealias CoordX = CGFloat
typealias CoordY = CGFloat

typealias DidSucceed = Bool

										/* MARK: Enums */
enum Position { case center }


										/* MARK: Protocols */
protocol Immutable {}
protocol Singleton {}
protocol Static {}
protocol Directory {}
protocol Declaration {}
protocol Assignment {}