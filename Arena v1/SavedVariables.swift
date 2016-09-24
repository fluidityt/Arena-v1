
import Foundation
import SpriteKit


/// Gets put to a save file
struct SaveData {
	
	// Data stuff..
	var engine_data: EngineData
	
	// Other stuff...
	let description = {
		print (SharedPrefs.data!)
	}

}


class	AllData {
	
	// Singlet declaration
	static var current_data = Data()
	private init() {}
	
	
	// List of all objects of engine + player data
	let save_files: [SaveData]?
	
	
	// Safely updates our constant array
	func getSavedData() {
		
		
	}
	

var _current_data: ToJSON()
	
	
	
	let saveGame = {
		let new_save = ToJSON()
	
		_current_data = new_save
	}
	
	
struct ToJSON {

	let save_files: [Data]?
	
	let latest_data: Data
		
	init() {
		if self.save_files == nil {
	
			
			
		

	
struct Data {
	
	let engine_data: EngineData?
	let player_data: PlayerData?
	
	struct	EngineData {
		
		let coords: Coords
		
		struct Coords
		{
			// Prev/cur
			let
			firstY: CGFloat = 0,
			prevY: CGFloat = 0,
			curY: CGFloat = 0,
		}

	}
		
	struct PlayerData {
	}
	
}

	init(file_to_add: Data) -> SavedDataObjectForJSON {
	
	func saveGame() {
		let saved_data = DataToJSON()

func loadGame()




		