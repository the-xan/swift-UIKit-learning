//lesson 23 - Optional Chaining

class Address {
    var street = "Deribasovskaya"
    var number = "1"
    var city = "Odessa"
    var country = "Ukraine"
}

struct Garage {
    var size = 2
}

class House {
    var rooms = 1
    var address = Address()
    var garage : Garage? = Garage()
}

class Car {
    var model = "Zaporojec"
    
    func start() {
    }
}

class Person {
    var cars : [Car]? = [Car()]
    var house : House? = House()
}

let p = Person()

p.cars![0]
p.house!

p.house!.garage!.size

if let house = p.house {
    if var garage = house.garage {
        garage.size 
    }
}
p.house?.garage?.size

