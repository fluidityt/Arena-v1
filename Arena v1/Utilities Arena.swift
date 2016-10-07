		//
		//  GS_Utilities.swift
		
		
		import Foundation
		import SpriteKit
		
		//------------------
		//<#MARK: - General#>:
		//------------------
		
		/// Toggles a bool t / f
		public func toggle (inout variable:Bool) {																								 v = "toggle"
			variable == true ?
				(variable = false) : (variable = true)
		}
		
		/// oop?
		public func showDictValues<t1, t2> (ok: Dictionary<t1, t2> ){														v = "showDictValues"
			print(("\(ok.description)"))
		}
		
		//public func append<T> (inout array: Array,_ value: T) {}
		
		
		//---------------
		//<#MARK: - MWINS#>:
		//---------------
		var _debug_counter = 0

		public func printd<t>(s: t) {
			_debug_counter += 1; print("DEBUG: \(s)    ___ \(_debug_counter)")
		}
		public func printl<t>(s: t) { print("LOG: \(s)")   }
		public func printe<t>(s: t) { print("ERRAR: \(s)")   }
		public func printt<t>(s: t) { print("TEST: \(s)")   }
//		public func printv<t>(s: t) { if G.Config.verbose == true {print("VERB: \(s)")   }}
		public var  v : String = ""
		//didSet { vvc+=1; if very_verbose == true {print("V: \(vvc):  \(v)") }} }
		
		
		//--------------
		//<#MARK: - MATH:#>
		//--------------
		/// For visibility on lhs (many things already are on rhs) and cuz swift3 SUCKS
		func plusplus(inout variable: Int)   {        variable += 1    }
	 func negneg(inout variable: Int)     {        variable -= 1    }
	
		func absV(num:CGFloat) -> CGFloat {
			return {	if num >= 0 { return num}	else { return (num * -1) }	}()
		}
		func slope(y1 y1: CGFloat, y2: CGFloat, x1:CGFloat, x2:CGFloat) -> CGFloat {
			let dY = (y2 - y1), dX = (x2 - x1), slope = (dY / dX); return slope
		}

		
		func average (nums: [CGFloat]) -> CGFloat {
			var total = CGFloat(0);	for num in nums {total += num}
			 return (total / CGFloat(nums.count))
		}
		
		func randy(int:Int) -> Int {
			
			let result = Int(arc4random_uniform(UInt32(int)))
			
			
			return result
		}
		
		// Float
		func random(range_min: CGFloat,_ range_max: CGFloat) -> CGFloat {
			
			let min = UInt32(range_min)
			let max = UInt32(range_max)
Hotfix() {
	printd("float min: ", min)
	printd("float max: ", max)
}
			errorChecking: do {
				if min > max {
					print("random error, min greater than max")
					return 999999999
				}
				
				if min == max {
					print("random error, min == max")
					return CGFloat(min)
				}
			}
			
			let middle = (max - min)
			
			let result: UInt32 = {
				
				let rand = arc4random_uniform(middle)
printd("cgfloat rand: ", rand)
				if rand == (max - 2) { return max }
				else								 { return rand + min }
			}()
			
printd(" cgfloat result: ", result)
			return CGFloat(result)
		}
		
		// Int
		func random(range_min: Int,_ range_max: Int) -> Int {
			
			let min = UInt32(range_min)
			let max = UInt32(range_max)
			
Hotfix() {
	printd("int min: ", min)
	printd("int max: ", max)
}
			errorChecking: do {
				if min > max {
					print("random error, min greater than max")
					return 999999999
				}
				
				if min == max {
					print("random error, min == max")
					return Int(min)
				}
			}
			
			let middle = (max - min)
			
			let result: UInt32 = {
				let rand = arc4random_uniform(middle)
printd("int rand", rand)
				if rand == (max - 2) {  return max }
				else								 { return (rand + min) }
			}()
printd("int result: ", result)
			return Int(result)
		}


		//---------------
		//<#MARK: - XCODE:#>
		//---------------
		/// To ignore annoying warnings
		public func disregard<t>(an:t){}
		
		/// Inline fun
		func Test(run_code:Bool = true,_ description:String = "",_ block: ()->() ) {
			if run_code == true {block()}
		}
		
		func ToDo(s:String){}
		
		/// Inline fun, with values
		func Test(description: String,_ values: [Any],_ block: ()->() ) {
			for indice in 0...values.count {	printt(values[safe: indice]) }
			print("\n"); block()
		}
		
		// For when there are no compile erros, just RTE, and you are hopping from one block
		// to another:
		/// Allows me to move back and forth quickly with one button (next issue)
		public struct Waypoint {}
		
		/// Alerts to me where I need to improve my code
		public struct Hotfix {	public init (_ block: ()->() ) { block() } }
		
		/// Allows me to turn on / off a block of code
		public struct Debug{public init(_ block:()->()){if Global.Config.exec==true{block()}}}
		
		
		
		//------------------
		//<#MARK: - Extensions#>
		//------------------
		
		/// OOP killer:
		extension SKNode {
			func removeFromParent(node: SKNode?){
				nilno(node) {
					node?.removeFromParent()
				}
			}
		}
		
		
		/// Makes safe extensions array[safe: index]
		extension Array {
	  subscript(safe index: Int) -> Element? {
			return index >= 0 && index < count ? self[index] : nil }
		}
		
		
		/// For formatting reasons
		extension SKAction {
			public class func colorizeWithColor(color color: UIColor, colorBlendFactor: CGFloat, duration sec: NSTimeInterval) -> SKAction
			{return (SKAction.colorizeWithColor(
				color,
				colorBlendFactor: colorBlendFactor,
				duration: sec))}
		}
		
			
		
		//-----------------
		//<#MARK: - SKStuff#>:
		//-----------------
		/// Moving sprites
		func moveSprite (named: SKSpriteNode?, to_the: CGVector,_ duration: NSTimeInterval = 0.25)
		{	v="moveSprite";	named!.runAction (SKAction.moveBy (to_the, duration: duration))	}
		
		func moveSprite( name :SKSpriteNode?, to :CGPoint)
		{ v="moveSprite2"; name!.runAction (SKAction.moveTo(to, duration: 0.5)) }
		
		//-TODO: Check for nil AFTER addNode returns
//		///-Shortcut for self.cNWN()
//		func childNodeWithName (node_name: String)
//			-> SKNode {																																							v = "addnode"
//				
//				//-Check for errors
//				guard nil != SELF.childNodeWithName(node_name) else {
//					printe("-> addNode: failed to init \(node_name)" +
//						"check spelling-- check node type-- check nil")
//					return error_node!
//				}
//				
//				//-Initialize it (node = return())
//				node_list.insert())
//				
//				printv("-> addNode \(node_name) success--")
//				return (SELF.childNodeWithName(node_name)!)
//				
//		}
//		
//		///-Shortcut for self.cNWN().cNWN()
//		func addNode2 (node_name: String, to this: String) -> SKNode {
//			printv(" -> addNode2: attempting \(node_name) ")
//			node_list.insert(node_name)
//			return SELF.childNodeWithName(this)!.childNodeWithName(node_name)!
//		}
//		
//		///-Shortcut for self.cNWN().cNWM().cNWN()
//		func addNode3 (node_name: String, to this: String, from that: String) -> SKNode {
//			printv(" -> addNode3: attempting \(node_name)")
//			node_list.insert(node_name)
//			return	SELF.childNodeWithName(that)!
//				.childNodeWithName(this)!
//				.childNodeWithName(node_name)!
//		}
//		
		
		//-----------
		//<#MARK: Nil:#>
		//-----------
		
		/// Runs code if not nil
		func nilno (potentially_nil_value: Any?,_ error_msg: String = "",_ run_this: ()->()) {
			var	s2 : String
			if		error_msg == ""					{ s2 = "-> nilno: Found a nil value!" }
			else											{ s2 = error_msg }
			
			if		potentially_nil_value == nil	{ printe(s2); return }
			else											{ run_this() }
		}
		
		/// Not for homework
		func safeAssign <ReturnType> (value_to_return: ReturnType?)	-> ReturnType {
			
			// Ensure safety
			guard value_to_return != nil else {
				
				// Entry: found nil
				print ("SR -> 1  : SR: $0 was nil! Can't assign to lhs")
				
				// Value is irrelevant at this point--
				// --switching value_to_return would be confusing
				let type = value_to_return
				
				switch ReturnType.self {
					
				case is Int.Type:
					print("SR -> 2.1: assigning lhs to default Int >0<"); return 0 as! ReturnType
					
			 case is String.Type:
				print("SR -> 2.2: assigning lhs to default String"); return "" as! ReturnType
					
			 default:
				// In case our switch breaks, we will know why it crashes
				print("SR -> 2.0: No cases found--RTE incoming")
					
				}//switch/>
				
				// Should force crash, but at least I'll know exactly why
				return type!
				
			}//guard/>
			
			// Let's get out of here safely ;)
		 //printv("SR -> Exit: Successfully Assigned lhs to \(value_to_return!)");
			return value_to_return!
			
		}//safeAssign/>
		
		
		
		// Junk
		/*
		
		/// Click for fun
		func clicked(node: SKNode?) -> Bool { node!.frame.contains(touch_loc!) ? return true : return false }
		*/
			