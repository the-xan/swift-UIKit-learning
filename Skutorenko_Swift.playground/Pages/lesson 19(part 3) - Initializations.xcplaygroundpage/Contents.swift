//lesson 19 - Failable Initializers
import Foundation

class Human {
    var weight : Int
    var age : Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func  test() {}
    
    deinit {
        print("Human deinitialized")
    }
}

enum Color : Int {
    case Black
    case White
    
    //Failable инициализатор создается через init? - это говорит что если во время инициализации произойдет какая-то ошибка то нам вернется nil
    init?(_ value: Int ) {
        switch value {
        case 0:
            self = Color.Black
        case 1:
            self = Color.White
        default:
            return nil
        }
    }
}

let a = Color(20)

let b = Color(rawValue: 2)


struct Size {
    var width : Int
    var height : Int
    
    init?(width: Int, height: Int) {
        //возвратить nil можем на любом этапе инициализации!
        self.width = width
        if height < 0 {
            return nil
        }
        self.height = height
    }
}

class Friend : Human {
    var name : String
    
    //мы можем инициализировать эту проперти через closure! воу...
    // обязательное условие - это возвращение значения такого же типа как наша проперти (Если проперти типа Color, я должен вернуть Color)
    let skin : Color = {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
        // () в конце означают, что когда дойдет время до дефолтной инициализации проперти skin с типом Color - будет вызван closure выше, автоматически. (Даже перед тем как он перейдет к инициализатору)
    }()
    
    init?(name: String) {
        //возвратить nil можем на любом этапе инициализации!
        if name.isEmpty {
            return nil
        }
        //в первую очередь надо инициализировать stored property текущего класса
        self.name = name
        //после - родительского
        super.init(weight: 0, age: 0)
    }
    
    // Если пишем required - то в дочерних классах мы обязаны переопределить инициализатор
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("Friend deinitialized")
    }
}



let f = Friend(name: "Jojo")


class BestFriend : Friend {
    
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
        super.init()
    }
    
    // деинициализаторы
    // Рассмотрим момент удаления объекта из памяти
    // Перед удалением обекта из памяти вызывается деинициализатор deinit
    // У каждого класса deinit собственный, его переопределять не надо
    deinit {
        print("BestFriend deinitialized")
    }
}

let b1 = BestFriend(name: "")
b1.name

let f1 = Friend(name: "Bob")
f1?.skin.rawValue

let f2 = Friend(name: "Bob")
f2?.skin.rawValue

let f3 = Friend(name: "Bob")
f3?.skin.rawValue


// деинициализаторы
// Рассмотрим момент удаления объекта из памяти

struct Test {
    var besrFriend : BestFriend? = BestFriend(name: "")
}

var test : Test? = Test()

test!.besrFriend = nil

var f4 = Friend(name: "")
