//lesson 18 - Inheritance -> Наследование
// Наследование есть только у классов! (структуры и энумы не наследуются)
// Если класс не наследуется, то такой класс считается базовым
class Human {
    // stored property
    var firstName : String = ""
    var lastName : String = ""
    // computer property
    var fullName : String {
        return firstName + " " + lastName
    }
    // method
    func sayHello() -> String {
        return "Hello"
    }
    
    //Если мы не хотим, чтобы наш метод был переопределен в дочерних классах то перед функцией надо поставить ключевое слово "final"
    final func printWelcome() -> String {
        return "Welcome"
    }
    
    // также со ctored property если мы не хотим чтобы в дочерних классах была возможность переопределения, то перед проперти надо поставить ключевое слово "final"
    final let soul : String = ""
}

// класс Student наследуется от класса Human, при наследовании класс Student полностью перенимет все property, методы и.т.д  от базового класса Human
// final - означает что классы не смогут наследоваться от класса Student
final class Student : Human {
   // можно при переопределении метода родительского класса возвратить сам метод и добавить новое условие используя оператор super
    override func sayHello() -> String {
        // super - это оператор который обращается непосредственно к нашему методу родительского класса
        return super.sayHello() + " my friend"
    }
    
    
}

class Kid : Human {
    // можем наследуемому классу добавить новые проперти у остальных наследуемых классов этой проперти не будет
    var favoriteToy : String = "iMac"
    
    // часто бывает так что методы базового класса нужно переопределить в наследуемых классах
    // Используй оператор override - для переопределения методов
    // Для переопределения метода необходимо повторить функцию полностью
    // Переопределение - это когда мы наследовали метод от родительского и мы можем использовать его услловия по другому
    override func sayHello() -> String {
        return "agu"
    }
    
    // override также можно использовать при переопределении computer property в нашем случае это getter
    // обязательно надо полностью повторить var - название переменной и тип
    override var fullName: String {
        return firstName
    }
    
    // override также можно использовать при переопределении stored property в computer property
    // но можно использовать что-то одно, либо setter и getter, либо обсерверы willSet и didSet
    override var firstName: String {
        // обязательно при указании setter`a надо указывать getter
        set {
            super.firstName = newValue + " =)"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
        didSet {
            print("new value " + self.lastName)
        }
    }
}

let human = Human()
human.firstName = "Alex"
human.lastName = "Skutarenko"
human.fullName
human.sayHello()

// класс Student не имея собственных проперти перенял все от базового класса Human
let student = Student()
student.firstName = "Max"
student.lastName = "Mix"
student.sayHello()

let kid = Kid()
kid.firstName = "Kid"

// добавили обсервер
kid.lastName = "123456"

//результат переопределения computer property
kid.fullName
kid.sayHello()




// пример -> ПОЛИМОРФИЗМА - когда объединяем 3 объекта разных типов в массив по общему признаку (в нашем случае это base class Human) и вызываем метод который есть у всех дочерних классов, но этот метод у каждого класса делает что-то "свое"
// массив будет типа Human (явно тип указывать не надо в этом случае просто пример)
// let array = [kid, student, human]
let arr : [Human] = [kid, student, human]

// можем пробежаться циклом по массиву
for value in arr {
    print(value.sayHello())
}



// Homework ->
 /*
  1. Создайте базовый класс артист с "именем", "фамилией" и методом "выступление". У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки). Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.

  2. Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computer properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы:
  -Как быстро мы сможем это сделать и каким транспортом?
  -Стоимость всех перевозок и количество?
  -Какой транспорт быстрее справится и какой более выгодный?

  */

class Artist {
    
    var firstName : String
    var lastName : String
    var performance : String
    
    var introdusing : String {
        return "On stage will perform: " + firstName + " " + lastName + " with " + performance
     }
    
    init(firstName: String, lastName: String, performance: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.performance = performance
    }
}



class Actor : Artist {
    static let mask = "Mask"
}

class Clown : Artist {
    static let toys = "Bag with toys"
}

class Dancer : Artist {
    static let boots = "Special boots for dancing"
}

class Painter : Artist {
    
    override var firstName: String {
        get {
            return String(super.firstName.reversed())
        }
        set {
            super.firstName = newValue
        }
    }
}

let actor = Actor(firstName: "John", lastName: "Joe", performance: "Sciene N8")
let clown = Clown(firstName: "Really", lastName: "Fun", performance: "Tips and Trics")
let dancer = Dancer(firstName: "Helena", lastName: "Coelee", performance: "Pool dance")
let painter = Painter(firstName: "Tomi", lastName: "DontSayMyName", performance: "Drowing portrets")

let array  = [actor, clown, dancer, painter]
for i in array {
    print(i.introdusing)
}
