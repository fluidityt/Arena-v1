
/** Should have private init and var
#### Usage:
		private init() {}
		private static var initiated: Bool = false
		static func makeNewInstance<T> ()
*/
private protocol SingleSafe {
	static func makeNewInstance<T> () -> T	// This should be internal
	static var initiated: Bool {	get	}	// This should be private
	init()	// This should be private
}


class Cat: SingleSafe {
	static func makeNewInstance<T>() -> T { return Cat() as! T }
	static var initiated: Bool = false
	
	var age = 0
	func meow() { print("nyaa")}
	required init() {		self.age += 5	}
}

let fluffy = Cat()
let zemmy = Cat()
fluffy = zemmy
fluffy.meow()


