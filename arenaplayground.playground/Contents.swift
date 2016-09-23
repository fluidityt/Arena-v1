//: Playground - noun: a place where people can play

import Cocoa
print("PG Executing... \n")
// Test

/*
	struct definition -> game data definition -> sp definition

	on entry:
		1. SP holds one instance of GD
		2. GD holds one instance of each GS
*/

struct GameStructs {
	// Player stuff
	struct Player {
		
		let age:	Int
		let name: String
	}
	
	
	// UX stuff:
	struct UX {
		
		let currentY:	Int
		let previousY: Int
	}
	
}; typealias GS = GameStructs

// data
struct GameData {
	
	// All my data:
	let
	player_data: GS.Player,
	ux_data: GS.UX
	
}; typealias GD = GameData

// shared
class SharedPrefs {
	
	static var data: GameData?
	
	static let description = { print (SharedPrefs.data!) }
}; typealias SP = SharedPrefs

// Quick updater:
// make it init?;
// Entry
initStuff: do {
	
	let new_player = GS.Player (age: 22, name: "max")
	let new_ux	= GS.UX (currentY: 1, previousY: 2)
	
	let newgame = GameData (player_data: new_player, ux_data: new_ux)
	
	SharedPrefs.data = newgame
	SP.description()
}

// first interaction
testStuff: do {


}
