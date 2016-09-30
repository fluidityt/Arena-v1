//
//struct Engine {}
//struct Player {}
//struct Wheel {}
//struct Enemy{}
//struct Acceleration{}
//
//
//// can use self for struct but not Class?
//
//public class MyData: OOP, Singleton {
//	
//	// Our singleton instance:
//	private static var current_data: Data?
//	private static var archived_data: [Data]?
//	private static var counter = 0
//	private init() {
//		// Default / initial INIT
//		// long list of variables
//		MyData.counter += 1
//		MyData.say()
//		
//	}
//	private init(makeDefaultData data: MyData) {}
//	private init(copyGlobalData data: MyData) {}
//	
//	// Our instance's directory to our Data object:
//	private let m_data_instance: MyData? = nil
//	
//	public static func saveToJSON() {
//		// saveJsonObject(self.saved_data)
//	}
//	
//	
//	// long list of default values init()
//	deinit {
//		MyData.counter = 0
//		print("deinit")
//	}
//	
//	// Tests the init capabilities
//	public static func say() {		print(MyData.counter)	}
//	public static func makeNewInstance() {		MyData.current_data = Data()	}
//	
//	
//}
//
