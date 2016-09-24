import Foundation
import SpriteKit


/// Directory for Engine Structs and their instances, includes smoothing, nodes, etc.
struct EngineData {
	
	/*
 		See bottom for list of constants with instances:
	
			nodes: Nodes, coords: Coords, angles: Angles, clock:	Clock, smoothing: Smoothing,
			other:		Other
	*/

	/// Keeps track of Engine Nodes
	struct Nodes:  {
		
		let error_node = SKNode?()
		let node_list = [SKNode()]
		let player = SKSpriteNode()
		let central: SKNode
		
	}
	
	struct Coords
	{
		// Prev/cur
		let
		firstY: CGFloat = 0,
		prevY: CGFloat = 0,
		curY: CGFloat = 0,
	}
	
	struct Angles {
		let
		curA: CGFloat = 0,
		
		superAngle = CGFloat(0)
		let full_circle = 6.281
	}
	
	struct Clock {
		
		var
		clock_count = 0,
		seconds = 0,
		
		firstTime: CFTimeInterval=0,
		timeThen: CFTimeInterval=0,
		timeNow: CFTimeInterval=0
		
	}
	
	struct Smoothing {
		var
		y1 = CGFloat(0),
		y2 = CGFloat(0),
		y3 = CGFloat(0)
		
	}
	
	struct Other {
		var	firstDrag = false
	}
	
	// Defined below the numerous structs for procedural reasons
	let
	nodes: Nodes,
	coords: Coords,
	angles: Angles,
	clock:	Clock,
	smoothing: Smoothing,
	other:		Other
	
	
	// This needs fixin' lol...
	init() {
		_current_engine_data = EngineData()
	}
}
