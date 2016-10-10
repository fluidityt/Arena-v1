struct Animal {
	private init() { print("no object")}
}


extension Animal {

	struct Cat  {
		
		// BS stuff:
		let age: Int
		let name: String
		
		func meow() {
			print (age, name)
		}
		
		
		/// Default tuple:
		typealias CatCurrents = ( age: Int, name: String)
		
		/// Loads defautls into the below static var
		static func setCurrents( age age: Int = 2,
		                         name: String = "Fluffy")
			-> CatCurrents {
				// Return default values set in the params
				return (age: age, name: name)
		}
		
		/// Used for making new cats:
		static var currents = Cat.setCurrents()

		
		// Init work:
		private init() {
			print("cat made")
		
			// Defautls:
			self.age =	Cat.currents.age
			self.name = Cat.currents.name
			
			// Restore to normal
			Cat.currents = Cat.setCurrents()
		}
		
		func setAge(newAge age: Int) -> Cat {
			
			// Update info
			Cat.currents = Cat.setCurrents(age: age)
			
			// init()
			let new_cat = Cat()
			return new_cat
		}
		
	}
	
}

extension Animal {

	static var
	cat = Cat()
}



Animal.cat.meow()







