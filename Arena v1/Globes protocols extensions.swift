//
//  newFunc.swift
//  Arena v1
//
//  Created by Dude Guy  on 9/23/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation


/// Gets put to a save file
struct SavedVariables {
	
	// Data stuff..
	static var data: GameData?
	
	
	// Other stuff...
	static let description = { print (SharedPrefs.data!) }
};typealias SP = SharedPrefs


var _system_file = SavedVariables()

let SELF: GameScene?
let CENTER_SCREEN: CGPoint?


/// NO INSTANCES
protocol Static {
	// init(noInstances: Static)
}
