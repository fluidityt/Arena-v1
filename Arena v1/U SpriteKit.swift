//
//  U SpriteKit.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit


/// OOP killer:
extension SKNode {
	func removeFromParent(node: SKNode?){
		nilno(node) {
			node?.removeFromParent()
		}
	}
}

/// For formatting reasons
extension SKAction {
	public class func colorizeWithColor(color color: UIColor, colorBlendFactor: CGFloat, duration sec: NSTimeInterval) -> SKAction
	{return (SKAction.colorizeWithColor(
		color,
		colorBlendFactor: colorBlendFactor,
		duration: sec))}
}

/// Moving sprites
func moveSprite (named: SKSpriteNode?, to_the: CGVector,_ duration: NSTimeInterval = 0.25)
{	named!.runAction (SKAction.moveBy (to_the, duration: duration))	}

func moveSprite( name :SKSpriteNode?, to :CGPoint)
{ name!.runAction (SKAction.moveTo(to, duration: 0.5)) }
	