//lesson 19 - Initialization -> Инициализация
// Переопределение инициализаторов в.т.ч родительский инициализотор
// Общая суть из этого урока - чтобы унаследовать все методы и инициализаторы родительского класса - надо переопредетиль designated метод родителя и.т.д

class Human {
    var weight : Int
    var age : Int

    init(weight: Int, age: Int) {
        self.age = age
        self.weight = weight
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
    
    func test() {}
}


class Student : Human {
    
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName

        super.init(weight: 0, age: 0)
        test()
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
       
        test()
        self.age = 28
    }
}
// правило 1 - если мы в дочернем классе не определяем свой собственный designated инициализатор - то автоматически наследуем все методы инициализаторы родителя
// при этом мы можем в дочернем классе использовать convenience инициализаторы
class Doctor : Student {
    
    var fieldOfStudy : String = ""
 /*
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firtName: "Doctor", lastName: "House")
    }
 */
    convenience init(fieldOfStudy: String) {
        self.init(firstName: "Doctor", lastName: "")
        
    }
    
}

let d1 = Doctor(firstName: "Jojo")
