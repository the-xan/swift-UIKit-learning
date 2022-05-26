//lesson 23 - Optional Chaining
import Foundation

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
    if let garage = house.garage {
        garage.size 
    }
}
p.house?.garage?.size

p.cars?[0].model

if p.cars?[0].start() != nil {
   print("start!")
} else {
    print("failure!")
}


//Type Casting -> (Приведение типов)
class Symbol {
    
}

class A : Symbol {
    func aa(){}
}

class B : Symbol {
    func bb(){}
}


// AnyObject - говорит, что в нашем массиве может лежать любой объект - экземпляр любого класса
// но в такой массив мы не сможем положить ничего кроме объектов!
let array1 : [AnyObject] = [A(), B(), Symbol(), A(), A(), B(), NSObject()]

// Any - говорит что в массиве может лежать все что угодно!
let array2 : [Any] = [A(), B(), Symbol(), A(), A(), B(), NSObject(), 5, "str", {() -> () in return}]


//полиморфизм
let array : [Symbol] = [A(), B(), Symbol(), A(), A(), B()]

var aCount = 0
var bCount = 0
var sCount = 0

for value in array {
    // оператор is возвращает булевое значение - да/нет (принадлежит ли наш инстанс типу а?)
    if value is A {
        let a = value as! A
        aCount += 1
    } else if value is B {
        bCount += 1
    } else {
        sCount += 1
    }
    
    // оператор as пытается привести константу let a к типу "А"
    if let a = value as? A {
        a.aa()
    } else if let b = value as? B {
        b.bb()
    }
    
    
}

aCount
bCount
sCount


// Homework ->
class Human {
    var father : String?
    var mother : String?
    var brothers : [String]?
    var sisters : [String]?
}

class Me {
    var father : Father?
    var mother : Mother?
    
}

class Father : Human {
    deinit {
        print("Father was deinit")
    }
}

class Mother : Human {
    deinit {
        print("Mother was deinit")
    }
}

let myPerson = Me()
myPerson.father?.brothers
myPerson.father
