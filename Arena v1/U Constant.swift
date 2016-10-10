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
typealias CGF	 = CGFloat
typealias CFTI = CFTimeInterval

// Describers:
typealias CoordX = CGFloat
typealias CoordY = CGFloat

typealias DidSucceed = Bool


										/* MARK: Enums */
enum Position { case center }


										/* MARK: Protocols */
protocol Singleton {}
protocol Static {}