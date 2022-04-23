// lesson 12 -> Enumerations (Enum): 

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn(direction : Action.Direction)
    
    //Nested type
    enum Direction : String {
        //Row value ->
        case Left = "Left!"
        case Right = "Right!"
    }

}

var action : Action = Action.Run(meters: 20, speed: 15)

action = .Stop
action = .Walk(meters: 20)


var direction = Action.Direction(rawValue: "Right!")!

action = .Turn(direction: direction)
//Assotiative values

switch action {
case .Stop: print("Stop")
    
case .Walk(let meters) where meters < 100  :
    print("Short walk - \(meters)")
    
case .Walk(_):
    print("Long walk")
    
case .Run(let m, let s):
    print("Run - \(m) meters with speed - \(s)")
    
case .Turn(let dir) where dir == .Left:
    print("Turn left")
    
case .Turn(let dir) where dir == .Right:
    print("Turn right")
    
default:
    break
}

//Output enum value
print(Action.Direction.Left.rawValue)


//Home work ->
// Task 1: Create enum with chess figures(king, queen e.t ) Each figure should have white or black color, and symbol + number of figure position. Create some figures with an arrangement on the board so that the black king is checkmated:

enum Chessman {
    case piece(color: Color, name: Name, position: String)
    
    enum Name : String {
        case king = "King"
        case bishop = "Bishop"
        case knight = "Knight"
    }
    
    enum Color : String {
        case white = "White"
        case black = "Black"
    }
}

let a = Chessman.Name.king.rawValue


let blackKing = Chessman.piece(color: .black, name: .king , position: "H8")
let whiteKing = Chessman.piece(color: .white, name: .king, position: "G4")
let whiteBishop = Chessman.piece(color: .white, name: .bishop, position: "C7")
let blackBishop = Chessman.piece(color: .black, name: .bishop, position: "E5")
let whiteKnight = Chessman.piece(color: .white, name: .knight, position: "F6")

// task 2
let arrayPieces = [blackKing, whiteKing, whiteBishop, blackBishop, whiteKnight]

func printChessboard(array: [Chessman]) {
    for i in array {
        switch i {
        case .piece(let color, let name, let position):
            print("Its \(color.rawValue) \(name.rawValue) on position \(position)")
        }
    }
}

printChessboard(array: arrayPieces)


//task 3

let cells = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]


func createChessboard(cells dict:[String:Int]) -> [String:String] {
    
    var chessboard = [String : String]()
    
    for keys in Array(cells.keys) {
        for value in Array(cells.values){
                if (cells[keys]! + value) % 2 == 0 {
                    chessboard["\(keys)\(value)"] = "\u{2B1B}"
                } else {
                    chessboard["\(keys)\(value)"] = "\u{2B1C}"
                }
            }
        }
    return chessboard
}






