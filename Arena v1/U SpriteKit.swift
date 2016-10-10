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

}

func runAction(action: SKAction, on node: SKNode) {
	node.runAction(action)
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
		return CGPoint( x: 0, y: 0)
	}
}

/// Moving sprites
func moveSprite( name :SKSpriteNode?, to :CGPoint)	{
	name!.runAction (SKAction.moveTo(to, duration: 0.5))
}

/// Because WTFAIL
func copyNode ( inout lhsNode lhs_node: SKSN, rhsNode rhs_node: SKSN) {
	 lhs_node.alpha = rhs_node.alpha
		 lhs_node.texture = rhs_node.texture
		 lhs_node.lightingBitMask = rhs_node.lightingBitMask
		 lhs_node.color = rhs_node.color
}
	