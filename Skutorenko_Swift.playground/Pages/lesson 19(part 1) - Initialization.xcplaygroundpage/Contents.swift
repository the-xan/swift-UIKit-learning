//lesson 19 - Initialization -> Инициализация
// Цель инициализаторов - установить каждое свойство (не опшионал) в какое-то значение
class Student1 {
    var firstName : String
    var lastName : String
    var fullName : String {
        return firstName + " " + lastName
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
    }
}

// Если есть возможность указавать сразу в классе значение(по дефолту), то эпл рекомендует делать это
class Student2 {
    var firstName = ""
    var lastName = ""
}

class Student3 {
    var firstName : String
    var lastName : String
    // для того, чтобы firtName и lastName использовались только локально надо использовать "_"
    init(_ firtName: String,_ lastName: String) {
        self.firstName = firtName
        self.lastName = lastName
    }
}

class Student4 {
    //Если используем опшинал проперти - их инициализировать не обязательно
    var middleName : String?
}

class Student5 {
    // константу maxAge можем объявить в инициализаторе
    let maxAge : Int
    
    init() {
        maxAge = 100
    }
}

// в дочерних классах мы не можем переопределить родительские константы
/*
class Student6 : Student5 {
    override init() {
        maxAge = 110 ---> выдаст ошибку!
    }
}
*/

let s1 = Student1()
let s2 = Student2()
let s3 = Student3("a","b")
let s5 = Student5()
s5.maxAge


//designated инициализаторы и combiniance инициализаторы

class Human {
    var weight : Int
    var age : Int
    //это designated инициализатор - он устанавливает все проперти
    init(weight: Int, age: Int) {
        self.age = age
        self.weight = weight
    }
    // но что если мы не знаем значение одного из пропертей, в таком случае надо использовать convenience инициализатор!
    //это convenience инициализатор (в нем можем вызывать designated инициализатор)
    // convenience инициализаторы могут вызывать инициализаторы только собственного класса! (Родительского не могут)
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    // также convenience инициализатор может вызывать другие convenience инициализаторы
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {}
}

let h1 = Human(weight: 70, age: 25)
let h2 = Human(weight: 0, age: 25)

let h3 = Human()


class Student : Human {
    
    var firstName : String
    var lastName : String
    
    init(firtName: String, lastName: String) {
        // в первую очередь надо инициализировать проперти дочернего класса Student
        self.firstName = firtName
        self.lastName = lastName
        // Потом перейти к инициализации родительского класса
        // Если мы наследовались от базового класса Human с не инициализированными пропертями, то в дочернем классе, в designated инициализаторе необходимо вызвать designated инициализатор родителя и проинициализировать его проперти
        super.init(weight: 0, age: 0)
        // после инициализации или "one - phase" (первая фаза) можно изменять проперти родителя, использовать методы
        test()
    }
    
    convenience init(firstName: String) {
        self.init(firtName: firstName, lastName: "")
        // после инициализации или "one - phase" (первая фаза) можно изменять проперти, использовать методы
        test()
        self.age = 28
    }
}

let student1 = Student(firstName: "a")
student1.lastName
student1.age
student1.weight

let student2 = Student(firtName: "a", lastName: "")
