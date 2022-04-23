//lesson 13 - Classes and Structures


//создаем класс - всегда с большой буквы
class StudentClass {
    
    // если проперти будут let то эти значения поменять не сможем!
    var name : String
    var age : Int
    
    //констуктор
    init() {
        name = "No name"
        age = 20
    }
    
    init(name: String, age: Int) {
        // self - указывает на текущий экземпляр
        self.name = name
        self.age = age
    }
    
}

//создаем объект класса Student
let stClass = StudentClass(name: "Bob", age: 18)
// даже если stClass - это константа, то значения мы можем менять т.к в классе StudentClass значения "name" и "age" - это переменные!!!
stClass.name = "No name"
stClass.age = 0



//структура
struct StudentStruct {
    
    var name : String
    var age : Int
    
}

var stStruct = StudentStruct(name: "Sam", age: 24)

// Если мы создали структуру - stStruct то значения в ней мы поменять не можем если это константа, если объект структуры stStruct - это переменная и значения в ней переменные то тогда можно присваивать новые значения!
stStruct.name = "Bean"
stStruct.age = 25


// при использовании структуры объекты копируются и каждый из них при изменении будет иметь свои параметры!
var stStruct1 = stStruct
stStruct1.name = "Pole"
stStruct1.age = 17

print(stStruct)
print(stStruct1)

// при использовании классов объекты имеют ссылочный тип, все созданные объекты =  будут ссылаться на первоначальный объект
var stClass1 = stClass
stClass1.name = "Owl"
stClass1.age = 253

print(stClass.name)
print(stClass1.name)


// кстати! можно создавать функции с 1 именем! Но с разными параметрами

// c функциями такая же ситуация (структуры клонируются и каждый объект остается со своими значениями 
func addOneYear(student: StudentStruct) {
    var student = student
    student.age += 1
}

addOneYear(student: stStruct1)
print(stStruct1)


// а объекты классов меняются!)
func addOneYear(student: StudentClass) {
    student.age += 1
}

addOneYear(student: stClass1)
print(stClass1.age)


// но можно заставить объекты структуры присвоить ссылочный тип также как и в классах для этого в функции можно написать "inout"
func addOneYear1( student: inout StudentStruct) {
    student.age += 1
}

addOneYear1(student: &stStruct1)
print(stStruct1.age)



// структуры также работают с массивами
var arrayStruct = [stStruct1]
arrayStruct[0].age = 76
stStruct1



//home work
