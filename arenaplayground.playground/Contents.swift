//: Playground - noun: a place where people can play

import Cocoa
print("*****  PG Executing...  *****\n")
// Test

/*
struct definition -> game data definition -> sp definition

on entry:
1. SP holds one instance of GD
2. GD holds one instance of each GS
*/

// struct
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
	
	struct Item {
		let name: String
	}
	
}; typealias GS = GameStructs


// data
struct GameData {
	
	// All my data... would be easy as var... lol
	let
	player_data: GS.Player,
	ux_data: GS.UX,
	item_list: [GS.Item]
	
	
	// There is an extended init below SharedPrefs...
	// Didn't put here for procedural reasons...
}; typealias GD = GameData


// Only
class SharedPrefs {
	
	// Data stuff..
	static var data: GameData?
	
	// Other stuff...
	static let description = { print (SharedPrefs.data!) }
}; typealias SP = SharedPrefs


// Extended to use SP and for copying / update ease
extension GameData {
	
	// Use this init to make a copy... pretty much only used in next func
	// (can't declare in func because fail)
	init(		updated_player pd: GS.Player = SP.data!.player_data,
	     		               updated_ux uxd: GS.UX = SP.data!.ux_data,
	     		                          updated_items itm: [GS.Item] = SP.data!.item_list) {
		
		iterateSelf: do {
			// Iterate through...
			self.player_data = pd
			self.ux_data = uxd
			self.item_list = itm
		}
	}
}


// Entry
initStuff: do {
	
	let new_player = GS.Player (age: 22, name: "max")
	let new_ux	= GS.UX (currentY: 1, previousY: 2)
	let items = GS.Item(name: "candy")
	
	let new_game = GameData (player_data: new_player, ux_data: new_ux, item_list: [items])
	
	SharedPrefs.data = new_game
	SharedPrefs.description()
}


// first interaction
testStuff: do {
	
	
}


print("\n***** PG Success!! *******")
