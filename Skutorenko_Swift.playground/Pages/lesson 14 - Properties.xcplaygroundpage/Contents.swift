//lesson 13 - Properties
// Stored properties
// Computer properties
import Foundation


struct Student {
    
    // Это Stored properties -> тут мы можем хранить какие-либо данные
    var firstName : String {
        // willSet(- это обсервер) показывает что происходит перед изменением структуры
        willSet {
            print("its willSet - will set " + newValue + " instead of " + firstName)
        }
        // didSet(- это обсервер) показывает что происходит после изменения структуры
        didSet {
            print("its didSet - will set " + firstName + " instead of " + oldValue)
            //capitalized переводит всю строку в lower case помимо первой - она становится заглавной
            firstName = firstName.capitalized
        }
    }
    
    // Это Stored properties -> тут мы можем хранить какие-либо данные
    var lastName : String {
        didSet {
            //capitalized - метод который переводит всю строку в lower case помимо первой - она становится заглавной
            lastName = lastName.capitalized
        }
    }
    
    // Это Computer properties -> тут данные хранить не получиться но обрабатывать и возвращать можно!
    var fullName : String {
        // при обращении к fullName в get можно возвратить значение
        get {
            return firstName + " " + lastName
        }
        // тут можно обработать данные
        set {
            print("fullName wants to be set to " + newValue)
            
            //components(separatedBy: " ") -> метод переводит строку в массив строк, которые разделены пробелом
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student = Student(firstName: "Tom", lastName: "Cortio")

student.firstName
student.lastName
student.fullName

student.firstName = "bob"
student.firstName
student.lastName
student.fullName


//Home work ->
/*
 
1. Самостоятельно повторить проделанное в уроке
 
2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
 
*/

let CurrentYear = 2022

struct BirthDate {
    
    static let maxDayInMonth = 31
    static let maxMonthInYear = 12
    
    var day : Int {
        didSet {
            if day > BirthDate.maxDayInMonth {
                day = oldValue
            }
        }
    }
    
    var month : Int {
        didSet {
            if month > BirthDate.maxMonthInYear {
                month = oldValue
            }
        }
    }
    
    var year : Int {
        didSet {
            if year > CurrentYear {
                year = oldValue
            }
        }
    }
}

struct NewStudent {
    
    static let maxLength = 15
    
    var firstName : String {
        didSet {
            firstName = firstName.capitalized
            if firstName.count > NewStudent.maxLength {
                firstName = oldValue
            }
        }
    }
    
    var lastName : String {
        didSet {
            lastName = lastName.capitalized
            if lastName.count > NewStudent.maxLength {
                lastName = oldValue
            }
        }
    }
    
    var fullName : String {
        get {
            return firstName + " " + lastName
        }
    }
    
    var BirthDate : BirthDate
        
    var currentOld : Int {
        get {
            return CurrentYear - BirthDate.year
        }
    }
    
    var yearsOfStudy : Int {
        get {
            if currentOld >= 17 {
                return 11
            }
            if currentOld > 6 && currentOld < 17 {
                return currentOld - 6
            }
            return 0
        }
    }
}

let studentBirthday = BirthDate(day: 23, month: 11, year: 2018)

var student1 = NewStudent(firstName: "Pablo", lastName: "Alfredi", BirthDate: studentBirthday)

student1.currentOld
student1.yearsOfStudy


/*
3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
*/

struct Segment {
    var pointA : Int
    var pointB : Int
    
    var middlePoint : Int {
        get {
            return (pointA + pointB)/2
        }
        set {
            pointA += 1
            pointB += 1
            print("New positions of point A is - \(pointA)")
            print("New positions of point B is - \(pointB)")
        }
    }
    
    var lenght : Int {
        get {
            if pointA > pointB {
                return pointA - pointB
            }
            return pointB - pointA
        }
        set {
            pointB *= 2
            print("New positions of point B is - \(pointB)")
        }
    }
}

var segment = Segment(pointA: 1, pointB: 3)
segment.lenght = 21
segment.pointA
segment.pointB
segment.middlePoint = 31
segment.pointA
segment.pointB

/*
4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
*/


