//lesson 15 - Type Properties -> Свойство типов

// При создании класса надо создать инициализатор внутри!
// При создании структуры инициализатор уже вшит в саму структуру


// Для того, чтобы не дублировать код в типах надо создавать глобальные переменные (это те, которые заключены вне контекста классов и структур)
//Если объявляем глобальную переменную 1 буква всегда заглавная
let MaxNameLength = 20

// Cвойства типу мы создаем только тогда, когда они должны относится ко всем экземплярам
class Human {
    
    var name : String {
        // проверка на длину вводимых символов
        didSet {
            if name.count > MaxNameLength {
                name = oldValue
            }
        }
    }
    
    // lazy stored property -> всегда var
    // загружаются только тогда, когда к ним обращаются
    lazy var storyOfMyLife : String! = "This is a story pf my entire life..."
    
    //Мы можем хранить константы для типов класса (в данном примере)! через stored property
    static let maxAge = 100
    
    // либо можем хранить данные через computer property
    class var maximumAge : Int {
        return 100
    }
    
    var age : Int {
        didSet {
            if age > Human.maximumAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// пример со структурой
struct Cat {
    
    var name : String {
        didSet {
            if name.count > MaxNameLength {
                name = oldValue
            }
        }
    }
    
    //Мы можем хранить константы для типов структуры (в данном примере)!
    static let maxAge = 20
    
    //И переменные
    static var totalCats = 0
    
    var age : Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    //Каждый раз, когда будет вызван инициализатор то общее количество кошек(totalCats) будет +1
    // (Вообще по умолчанию иницализатор в свифт стоит по дефолту)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
    
}

// это экземпляр
let human = Human(name: "Peter", age: 40)

human
human.storyOfMyLife
print(human)

// и это экземпляр
var cat = Cat(name: "Whiten", age: 10)


//В энумах также можем хранить stored properties (экземляр энума не может хранить stored property но сам тип может!)
enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Bottom
    
    //можно создать computer property для экземляров
    // Если выбрали либо Top либо Bottom - isVertical будет возвращать true
    var isVertical : Bool {
        return self == Direction.Top || self == .Bottom
    }
    
    var isHorizontal : Bool {
        return !isVertical
    }
    
}
// пример хранения данных в типе в stored property
Direction.enumDescription

// пример использования computer property в экземпляре энума
let a = Direction.Right
a.isHorizontal





// Homework ->
/* task 1
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)

 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 */


struct FileDescription {
    
    static let fileContent = "MainSystemFile.sys"
    static let maxFileNameLength = 15
    static let StandartSystemsFileLocation = "C://system files/main/"
    
    var fileName : String {
        didSet {
            if fileName.count > FileDescription.maxFileNameLength {
                fileName = oldValue
            }
        }
    }
    
    var fileLocation : String {
        get {
            return  FileDescription.StandartSystemsFileLocation + fileName
        }
    }
    
    var maxFileWeight : Int8
    
    var packageLocation : String {
        get {
            return FileDescription.StandartSystemsFileLocation
        }
    }
    
    var isHidden : Bool
    
    var insideOfFile : String {
        get {
            if isHidden {
                return "Cant see inside of this file"
            }
            return FileDescription.fileContent
        }
    }
 
}

var systemFile = FileDescription(fileName: "inc86", maxFileWeight: 127, isHidden: true)
systemFile.insideOfFile
systemFile.packageLocation


/*
 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
*/

//для подсчета кейсов внутри этого энума используем протокол CaseIterable
enum Spectre : Int, CaseIterable {
    
    case Red = 0xFF0000
    case Green = 0x00FF00
    case Blue = 0x0000FF
    
    static let colorsCount = Spectre.allCases.count
    
}

Spectre.colorsCount



/*
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */

class NewHuman {
    static let maxLength = 10
    
    static var humanCount = 0
    
    var firstName : String {
        didSet {
            if firstName.count > NewHuman.maxLength && firstName == " " {
                firstName = oldValue
            }
        }
    }
    
    var lastName : String {
        didSet {
            if lastName.count > NewHuman.maxLength && lastName == " " {
                firstName = oldValue
            }
        }
    }
    
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        
        NewHuman.humanCount += 1

        if firstName.count > NewHuman.maxLength {
            self.firstName = " "
            print("Write name correctly")
        }
        
        if lastName.count > NewHuman.maxLength {
            self.lastName = " "
            print("Write surname correctly")
        }
        
    }
}

let newHuman = NewHuman(firstName: "Tom", lastName: "Abracadabra")
NewHuman.humanCount


