postfix operator +-+ {}
postfix func +-+ (s: Any) -> Any {
 print(s)
 return s
}

prefix operator <- {}
prefix func <- (data: Any) -> Any {
	return data
}

class Cat {
	static var age = 43
}

let m = <-Cat.age
print (m)

infix operator ^^ {}

func ^^ (l: Int, r: Int) { print(r)}

let s = 4+-+

2 ^^ 5 

