// lesson 16 -> Methods
// Методы могут пренадлежать  типам - класс, структура, перечисление
struct Point {
    var x : Int
    var y : Int
    
    //В методе первый параметр желательно реализовывать локально а следующие - глобально
    // mutating - означает что наша функция будет менять свойства (в enum и struct)
    
    mutating func moveByX(_ x: Int, andY y: Int) {
        //self - нам показывает "себя" характеризует сам экземляр в котором был вызван этот метод
        self.x += x
        self.y += y
    }
    
    // в mutating методах может менятся сам self
    // Вызываем контруктор собственного типа Point
    mutating func moveBy(byX x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
    
}


func move(point: inout Point, byX x: Int, andY y: Int) -> Point {
    point.x += x
    point.y += y
    return point
}


var p = Point(x: 1, y: 1)

//move(point: &p, byX: 2, andY: 4)
p = move(point: &p, byX: 2, andY: 4)

p.moveByX(5, andY: 7)
print(p)

p.moveBy(byX: 1, andY: 1)
print(p)


enum Color {
    
    // ранее мы записывали данные через проперти - можем также записать данные в методе
    static func numberOfElements() -> Int {
       return 2
    }
    
    case White
    case Black
    
    //Если функция возвращает тип Color, то можно использовать другие методы в типе вот так - color.invert().printColor()
    mutating func invert() -> Color {
        if self == .White {
            self = .Black
        } else {
            self = .White
        }
        self.printText()
        return self
     //   self = (self == .White) ? .Black : .White
    }
    
    func printColor() {
        if self == .White {
            print("White")
        } else {
            print("Black")
        }
    }
    
    func printText() {
        print("enum")
    }
}

var color = Color.White
color
color.invert()
color.printColor()

//Если функция возвращает тип Color, то можно использовать другие методы в типе вот так - color.invert().printColor()
color.invert().printColor()

Color.numberOfElements()


//Homework ->
/*
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
*/

/*
2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
*/

/*
3.
Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
*/


struct Player {
    
    var positionX : Int {
        didSet {
            if positionX > Room.height || positionX <= 0 {
                positionX = oldValue
            }
        }
    }
    
    var positionY : Int {
        didSet {
            if positionY > Room.width || positionY <= 0 {
                positionY = oldValue
            }
        }
    }
    
    mutating func moveTo(direction: Direction) -> Player {
        switch direction {
        case .Right:
            self.positionY += 1
            break
        case .Left:
            self.positionY -= 1
            break
        case .Down:
            self.positionX += 1
            break
        case .Up:
            self.positionX -= 1
            break
        }
        return self
    }
}

struct Box {
    
    var positionX : Int {
        didSet {
            if positionX > Room.height || positionX <= 0 {
                positionX = oldValue
            }
        }
    }
    
    var positionY : Int {
        didSet {
            if positionY > Room.width || positionY <= 0 {
                positionY = oldValue
            }
        }
    }
    
    mutating func moveTo(direction: Direction) -> Box {
        switch direction {
        case .Right:
            self.positionY += 1
            break
        case .Left:
            self.positionY -= 1
            break
        case .Down:
            self.positionX += 1
            break
        case .Up:
            self.positionX -= 1
            break
        }
        return self
    }
}

enum Objects : String {
    case Player = "👨‍🎓"
    case Box = "📕"
    case EmptyField = "⬜"
}

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

struct Room {
    static let width = 8
    static let height = 8
    
    var player : Player
    var box : Box
    
    func printRoom() {
        for byX in 1...Room.width {
            var row = ""
            for byY in 1...Room.width {
                switch (byX, byY) {
                case (player.positionX, player.positionY):
                    row += Objects.Player.rawValue
                    break
                case (box.positionX, box.positionY):
                    row += Objects.Box.rawValue
                    break
                default:
                    row += Objects.EmptyField.rawValue
                }
            }
            print(row)
        }
        print(" ")
    }
    
    init(player: Player, box: Box) {
        self.box = box
        self.player = player
    }
}


var newPlayer = Player(positionX: 1, positionY: 1)
var box = Box(positionX: 5, positionY: 7)
var room = Room(player: newPlayer, box: box)

newPlayer.moveTo(direction: .Down)
newPlayer.positionX
newPlayer.positionY
room.printRoom()




