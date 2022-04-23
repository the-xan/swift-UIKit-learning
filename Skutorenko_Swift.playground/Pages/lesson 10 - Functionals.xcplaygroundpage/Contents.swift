import Foundation


func calculateMoney(wallet: [Int], type: Int? = nil) -> (total: Int , count: Int) {
    var sum = 0
    var count = 0
    
    for value in wallet {
        
        if (type == nil) ||
        (value == type!) {
            sum += value
            count += 1
        }
    }
    
    return (sum, count)
}

let myWallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

let (money, count) = calculateMoney(wallet: myWallet)
money
count


calculateMoney(wallet: myWallet, type: 5)


// Home work ->
// task 1: Create some func with short name, which return string with cool symbol or symbols. For example - Func heart() will return hearth... Call all of these func inside print() for output string these symbols uses concatenation

func seeNoMonkeyEmoji() -> String {
    let seeNoMonkey = "\u{1F648}"
    return seeNoMonkey
}

func hearNoMonkeyEmoji() -> String {
    let hearNoMonkey = "\u{1F649}"
    return hearNoMonkey
}

func speakNoMonkeyEmoji() -> String {
    let speakNoMonkey = "\u{1F64A}"
    return speakNoMonkey
}

print(seeNoMonkeyEmoji() + hearNoMonkeyEmoji() + speakNoMonkeyEmoji())


//task 2: It`s chess cells again =) Realize func, that takes letter, number and return string "white" or "black". Than this string output to the console

func findCellColor(symbol: String, number: Int) -> String? {
    var chest = [String : String]()
    
    let cells = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]

    for keys in Array(cells.keys) {
        for value in Array(cells.values){
            chest["\(keys)\(value)"] = (cells[keys]! + value) % 2 == 0 ? "black" : "white"
        }
    }
    
    let color = chest[symbol.uppercased() + "\(number)"]
    
    return color
}

findCellColor(symbol: "A", number: 2)


//task 3: Create func, which take array, and returns array in reverse order.

let myMoney = [100, 50, 20, 10, 5, 2, 1]


func reverseArray(array: [Int]) -> [Int] {
    var returnArray : [Int] = []

    for i in array {
        returnArray.insert(i, at: 0)
    }
    
    return returnArray
}


reverseArray(array: [10, 20, 30, 40, 50])


//task 5: 


let someText = "A chance alignment may have revealed a star from the universe’s first billion years. If confirmed, this star would be the most distant one ever seen, obliterating the previous record (SN: 7/11/17). Light from the star traveled for about 12.9 billion years on its journey toward Earth, about 4 billion years longer than the former record holder, researchers report in the March 30 Nature. Studying the object could help researchers learn more about the universe’s composition during that early, mysterious time. These are the sorts of things that you only hope you could discover, says astronomer Katherine Whitaker of the University of Massachusetts Amherst, who was not part of the new study."


func text(inputText: String) -> String {
    var str = ""
    
    let numbers = ["1" : "one", "2" : "two", "3" : "three", "4" : "four", "5" : "five", "6" : "six", "7" : "seven", "8" : "eight", "9" : "nine", "0" : "zero"]
    
    for i in inputText.lowercased() {
        switch i {
        case "a", "e", "i", "o", "u":
            str += i.uppercased()
        case "b","c","d","f", "g","j","k","l","m","n","p","q", "s", "t", "v", "x", "z", "h", "r", "w", "y" :
            str += i.lowercased()
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            str += numbers["\(i)"]!
        case " ":
            str += "\(i)"
        default:
                break
        }
    }
    
    return str
}

print(text(inputText: someText))

