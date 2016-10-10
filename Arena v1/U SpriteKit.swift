//
//  U SpriteKit.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit

// mostly for oop nonsense

// OOP killer:
extension SKNode {

	func removeFromParent(node: SKNode?){
		nilno(node) {
			node?.removeFromParent()
		}
	}

	func runAction(action: SKAction, on node: SKNode) {
		node.runAction(action)
	}
}

/// For formatting reasons
extension SKAction {
	public class func colorizeWithColor(color color: UIColor, colorBlendFactor: CGFloat, duration sec: NSTimeInterval)
		-> SKAction	{
			return (SKAction.colorizeWithColor(
		color,
		colorBlendFactor: colorBlendFactor,
		duration: sec))}
}

/// Return CGPoint
func getCenter(node:SKNode) -> CGPoint {
	return (CGPoint(x:CGRectGetMidX(node.frame),
		y:CGRectGetMidY(node.frame)))
}

func setPosition( position: Position, scene: SKScene) -> CGPoint {
	switch position {
		
	case .center:
		return CGPoint( x: scene.frame.midX,
		                y: scene.frame.midY)
	default:
		()
	}
}

/// Moving sprites
func moveSprite( name :SKSpriteNode?, to :CGPoint)	{
	name!.runAction (SKAction.moveTo(to, duration: 0.5))
}
	