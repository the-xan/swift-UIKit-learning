//lesson 8 -> Dictionary
// Dictionary cosist off the key + value, ex:

/*
let dictionary : [String : String] = ["statusCode" : "200", "message" : "ok"]
let dictionary1 : [Int : String] = [0 : "hello", 1 : "world"]
let dictionary2 : Dictionary<String, Double> = ["a" : 2.0]

//забираем значение по ключу сабстриктом
dictionary["statusCode"]

dictionary1[0]
*/

var dictionary = ["машина" : "car", "мужик" : "man"]
dictionary["мужик"]

// количество пар ключ - значение
dictionary.count

dictionary.isEmpty

var dict = [String : String]()

dictionary["комп"] = "computer"

// забираем массив ключей с помощью dictionary (порядок KEYS разный!)
Array(dictionary.keys)

// забираем массив значений с помощью dictionary (порядок VALUE разный!)
Array(dictionary.values)

/*
// добавляем значение ключу
dictionary.updateValue("mac", forKey: "комп")


// значение с дикшинари возвращаются в optional (String/Int и т д)
let comp : String? = dictionary["комп"]

// удаляем значение по ключу
dictionary.removeValue(forKey: "мужик")
dictionary = [:]
*/

for key in dictionary.keys {
    print("key = \(key), value = \(dictionary[key]!)")
}

for (key, value) in dictionary {
    print(key)
    print(value)
}


// Home work ->
// task 1: Create dictionary as a student`s journal, where name and last name it`s key,  and the score for the control it`s value

var studentJournal = ["Michael Cors" : "98",
                      "Sam Simon" : "50",
                      "Nick Jellye" : "78",
                      "Lara Samuel" : "95",
                      "Nina Gingertail" : "84"]

// Raise some student`s scores - they retook

studentJournal["Sam Simon"] = "75"
studentJournal.updateValue("90", forKey: "Nina Gingertail")

// Add of students, whitch transfered to your group

studentJournal["Kira Nevergone"] = "nil"
studentJournal["Elizee Ever"] = "nil"

// them delete some students from journal, because they left you

studentJournal.removeValue(forKey: "Michael Cors")
studentJournal.removeValue(forKey: "Lara Samuel")

// Calculate the total score of the group, and calculate average score

var totalScore = 0
let studentsCount = studentJournal.count
var newStudents = 0

for value in Array(studentJournal.values) {
    if let a = Int(value) {
        totalScore += a
    } else {
        print("Value - \(value), cant convert to Int")
        newStudents += 1
    }
}
print("Total score of students group - \(totalScore)")
print("Average score of full group - \(totalScore/studentsCount)")
print("Average score of group without new students - \(totalScore/(studentsCount-newStudents))")


// task 2: Create dictionary, where month its key, number of days its value

let year = ["January" : 31,
            "February" : 28,
            "March" : 31,
            "April" : 30,
            "May": 31,
            "June": 30,
            "July" : 31,
            "August" : 31,
            "September" : 30,
            "October" : 31,
            "November" : 30,
            "December" : 31]

// In cycle output the key - value in pairs
// Once use tuple

for (month, days) in year {
    print("In \(month) - \(days) days")
}

// And another case, go through the array of keys and get the values for each of them

for i in Array(year.keys) {
    print("In \(i) - \(year[i]!) days")
}

// task 3: Create another dictionary, in which key - its adress of the chest cell (ex. A5, B3, G3), and value its - Bool. If square have white color - value will be "true", else square have black color - value will be "false". Output dictionary to console and make sure that everything is correct. (Reccomendation : try to use a nested cycle)

var chest = [String : Bool]()
/*
let symbolsInChest = ["A", "B", "C", "D", "E", "F", "G", "H"]
let numberInChest = ["1", "2", "3", "4", "5" ,"6" ,"7" ,"8"]
let numberOfSymbol = ["A" : 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]

for symbol in symbolsInChest {
    for number in numberInChest {
        if ((numberOfSymbol["\(symbol)"]! + Int(number)!) % 2) == 0 {
            chest["\(symbol + number)"] = false
        } else {
            chest["\(symbol + number)"] = true
        }
    }
}
print(chest)
*/
let cells = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]

for keys in Array(cells.keys) {
    for value in Array(cells.values){
        if (cells[keys]! + value) % 2 == 0 {
            chest["\(keys)\(value)"] = false
        } else {
            chest["\(keys)\(value)"] = true
        }
    }
}



print(chest)
