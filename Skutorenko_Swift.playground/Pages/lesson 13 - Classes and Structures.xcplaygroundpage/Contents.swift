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



//home work ->
// task 1 : Создать структуру "студент" с параметрами - имя, фамилия, год рождения, средний бал оценок. Сделать несколько экземпляров и заполнить их данными
// положить в массив "журнал студентов"

struct StudentDataStruct {
    var name : String
    var middleName : String
    var birthYear : Int
    var averageGrade : Double
}


let firstStudentStruct = StudentDataStruct(name: "Alex", middleName: "Skutarenko", birthYear: 1985, averageGrade: 4.12)
let secondStudentStruct = StudentDataStruct(name: "Sam", middleName: "Samuel", birthYear: 1992, averageGrade: 4.78)
let thirdStudentStruct = StudentDataStruct(name: "Simon", middleName: "Belaris", birthYear: 1999, averageGrade: 3.89)
let fouthStudentStruct = StudentDataStruct(name: "Nana", middleName: "Belaris", birthYear: 1999, averageGrade: 4.57)
let fifthStudentStruct = StudentDataStruct(name: "Coldlac", middleName: "Wirewolf", birthYear: 1994, averageGrade: 3.56)


//task 2: написать функцию которая будет принимать массив "журнал  студентов" и выводить в консоль данные студента - имя фамилия и.т.д Перед каждым стурдентом надо поставить номер - 'по списку из журнала' -> порядковый номер в этом журнале

var studentsJournalStruct = [firstStudentStruct, secondStudentStruct, thirdStudentStruct, fouthStudentStruct, fifthStudentStruct]

func printStudentsData(_ array: [StudentDataStruct]) {
    
    var number = 0
    for i in array {
        number += 1
        print("\(number): Name - \(i.name), middleName - \(i.middleName), birth year - \(i.birthYear), average grade - \(i.averageGrade)")
    }
}

printStudentsData(studentsJournalStruct)


// task 3: отсортируйте массив по среднему баллу студентов по убыванию
let maxToMinAverageGrade = studentsJournalStruct.sorted() {$0.averageGrade > $1.averageGrade}
print("Sorted by max To Min Average Grade - \(maxToMinAverageGrade)")


// task 4: Создать функцию с сортировкой по фамилии (по алфавиту)

let sortedByMiddleName = studentsJournalStruct.sorted() {
    ($0.middleName != $1.middleName) ? $0.middleName < $1.middleName : $0.name < $1.name
}

print("sorted By Middle Name - \(sortedByMiddleName)")

//tasl 5: Создать переменную и прировнять ее к массиву, в существующем массиве поменять данные студента, посмотреть что стало с новым массивом? поменялся ли он
var anotherStudentJournal = studentsJournalStruct

anotherStudentJournal[0].averageGrade = 4.01
anotherStudentJournal[1].averageGrade = 3.86

print("New journal - \(anotherStudentJournal)")
print("Old journal - \(studentsJournalStruct)")

//task 6: Проделать тоже самое но с классами
class StudentsDataClass {
    var name : String
    var middleName : String
    var birthYear : Int
    var averageGrade : Double
    
    init(name: String, middleName: String, birthYear: Int, averageGrade: Double ) {
        // self - указывает на текущий экземпляр
        self.name = name
        self.middleName = middleName
        self.birthYear = birthYear
        self.averageGrade = averageGrade
    }
}


let firstStudentClass = StudentsDataClass(name: "Shon", middleName: "Loly", birthYear: 1978, averageGrade: 3.22)
let secondStudentClass = StudentsDataClass(name: "Jane", middleName: "Donut", birthYear: 1985, averageGrade: 3.58)
let thirdStudentClass = StudentsDataClass(name: "Olly", middleName: "Templeton", birthYear: 1997, averageGrade: 4.32)


