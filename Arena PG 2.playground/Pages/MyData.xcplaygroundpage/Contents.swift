import Foundation


protocol Static {}
protocol Singleton {}
protocol OOP {}

// TODO: run performance tests
// TODO: Should I use nil for basic inits, or something else?, or perhaps make a init(default: Void) for each? but one that actually instantiateds something good
// todo applewatch tower defense circular


	
/// Data management: (Fuck OOP)
struct MyData {

	/// The main DPS data mat that holds both the datas I need
	struct Data {
		
		/// Holds engine data
		struct	EngineData {
            
            /// Holds coord data
			struct CoordData		{
		
				let
				firstY: Double,
				prevY: Double,
				curY: Double
			}
            
            /// CD members:
			let coord_data_instance: CoordData?
			
            // CD init:
            init() {
				coord_data_instance = nil
			}
		}
        
		// Holds player data
		struct PlayerData {
            
            struct StatData  {
            }
            
            init() {
                stat_data_instance = nil
            }
            
            // PD members:
            let stat_data_instance: StatData?
        }
    
		// Data members:
		let engine_data_instance: EngineData?
		let player_data_instance: PlayerData?
		
		// Data init:
		init() {
			self.engine_data_instance = nil
			self.player_data_instance = nil
		}
	}
	
	// MyData members:
	let saved_data_instances: [Data]?
	let current_data_instance: 	Data?
	
	/// MyData init:
	init(){
		saved_data_instances = nil
		current_data_instance=nil
		
	}
}

/// Global
struct Global: Static {
	private init() {}
	
	static var my_data = MyData()
	
}



/// For use inside of updateData()
extension MyData {
	
	/// Call when updating data or saving FIXME: This could cause bugs with nil
    // FIXME: it looks like this auto-saves everytime we update any data...
	init( updated_saved_data_instances usdi: [Data]
		= Global.my_data.saved_data_instances!,
          updated_current_data_instance ucdi: Data) {
		
        // For appendaging
		var new_list = usdi
		 new_list.append (ucdi)
		
		// MyData membaz:
		self.saved_data_instances  = usdi
		self.current_data_instance = ucdi
	}
}

extension MyData.Data {
	
	/// Allows us to update the data easily
	init(
		updatedEngineInstance edi: EngineData
            = Global.my_data.current_data_instance!.engine_data_instance!,
		updatedPlayerInstance pdi: PlayerData
            = Global.my_data.current_data_instance!.player_data_instance!
		){
		engine_data_instance = edi
		player_data_instance = pdi
	}
}

extension MyData.Data.EngineData {

    /// Allows us to update the data easily
    init(updatedCoordInstance uci: CoordData =
			Global.my_data.current_data_instance!.engine_data_instance!.coord_data_instance!) {
        coord_data_instance = uci
    }
}

/// Controls stuff
struct System {
	
	/// file path for JSON
	static let file_path = "root/games/spinny/saves"
	
	/// Saves JSON from filepath
	static func saveGame(){
		// writeToJSON(Global.my_data)
	}
	
	/// Loads JSON from filepath
	static func loadGame(){
		// Global.my_data = readFromJSON(System.file_path)
	}
	
    /// Call on rhs of Global.my_data
	static func updateData<t> (data: t) -> MyData {
		
        // Brevity:
		typealias EngineData = MyData.Data.EngineData
        typealias Data = MyData.Data
        
		// Return fodder
		let new_my_data_instance: MyData
		
		switch data {
			
		case is EngineData.CoordData:
			
            // We have a coord_data_instance
			let new_coord_instance = data as! EngineData.CoordData
			
			let new_engine_instance = EngineData(updatedCoordInstance: new_coord_instance)
            
            let new_data_instance  = Data(updatedEngineInstance: new_engine_instance)
            
            new_my_data_instance = MyData(updated_current_data_instance: new_data_instance)
            
		default:
        	// Big errors in store
            new_my_data_instance = MyData()
        
        }
        
        return new_my_data_instance
    }
}

// Entry
initStuff: do {
	let printCoords = {
		print(Global.	my_data.current_data_instance?.engine_data_instance?.coord_data_instance!.curY
		)
	}
	
	printCoords()
	    
}

// first interaction
testStuff: do {
    
    // These are important aliases
    typealias Engine = MyData.Data.EngineData
    typealias Player = MyData.Data.PlayerData
    
    tryToUpdateACoord: do {
        let new_coords = (firstY: 1.1, prevY: 2.2, curY: 3.3)
        
        let new_coord_instance = Engine.CoordData(firstY: new_coords.firstY, prevY: new_coords.prevY, curY: new_coords.curY)
        
    //    Global.my_data = System.updateData(new_coord_instance)
    }
	
}
print("\n***** PG Success!! *******")
*/
}

struct Animal {}

extension Cat