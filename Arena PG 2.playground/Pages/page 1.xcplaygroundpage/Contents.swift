import Foundation
import SpriteKit

protocol Static {}
protocol Singleton {}
protocol OOP {}



/// Fuck OOP
struct MyData {
	
	// members...
	let saved_data_list: [Data]?
	let current_data: 	Data?
	
	
	/// First time init
	init(){
		saved_data_list = nil
		current_data		= nil
		print("mydata init!")
	}
	
	/// Call when updating data or saving
	init(newest_list: [Data]?, newest_data: Data?) {
		var new_list = newest_list!
		new_list.append (newest_data!)
		
		self.saved_data_list = new_list
		self.current_data = newest_data!
	}
	
	
	// The main DPS data mat that holds both the datas I need
	struct Data {
		
		// The two types of data I need for this game
		let engine_data: EngineData?
		let player_data: PlayerData?
		
		// Nilinit
		init() {
			self.engine_data = nil
			self.player_data = nil
		}
		
		
		struct	EngineData {
			// instances are at the bottom
			
			struct Coords
			{
				// Prev/cur
				let
				firstY: CGFloat = 0,
				prevY: CGFloat = 0,
				curY: CGFloat = 0
			}
			
			// Instances:
			let coords: Coords
			
		}
		
		struct PlayerData {
		}
		
	}
	
}


// Controls stuff
struct System {
	
	
	static let file_path = "root/games"
	
	
	static func saveGame(){
		// writeTo(file_path, Saver.instance)
	}
	
	static func loadGame(){
		// Saver.instance = readFrom(file_path)
	}
	
	static func updateData<t> (newData data: t, forVar vari: MyData) {
		
	}
}


// Global
var _my_data = MyData()


// Entry
initStuff: do {
	
	typealias Engine = MyData.Data.EngineData
	
	print ( _my_data.current_data?.engine_data?.coords.curY )
	
	let new_coords = Engine.Coords()
	
	System.updateData(newData: new_coords, forVar: _my_data)
	
}


// first interaction
testStuff: do {
	
	
}


print("\n***** PG Success!! *******")

