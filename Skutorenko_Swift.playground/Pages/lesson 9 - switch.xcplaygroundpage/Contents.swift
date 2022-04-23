// lesson 9 -> switch
// Home work:
// task 1 - Create string with random text (min 200 symbols).

let someText = "A chance alignment may have revealed a star from the universe’s first billion years. If confirmed, this star would be the most distant one ever seen, obliterating the previous record (SN: 7/11/17). Light from the star traveled for about 12.9 billion years on its journey toward Earth, about 4 billion years longer than the former record holder, researchers report in the March 30 Nature. Studying the object could help researchers learn more about the universe’s composition during that early, mysterious time. These are the sorts of things that you only hope you could discover, says astronomer Katherine Whitaker of the University of Massachusetts Amherst, who was not part of the new study."



// use cycle and switch operator, count the number of vowels, consonants, digits and symbols
var sum = (vowels: 0, consonants: 0, spaces: 0, numbers: 0, symbols: 0)

for i in someText.lowercased() {
    
    switch i {
        case "a", "e", "i", "o", "u":
            sum.vowels += 1
        case "b","c","d","f", "g","j","k","l","m","n","p","q", "s", "t", "v", "x", "z", "h", "r", "w", "y" :
            sum.consonants += 1
        case " ":
            sum.spaces += 1
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            sum.numbers += 1
        default:
            sum.symbols += 1
    }
}

print(sum)


// task 2 Create the switch operator that accepts a person`s age and outputs a discription of the life cecle

let humanAge = 21

switch humanAge {
case 0...2:
    print("its baby time")
case 2...6:
    print("Its kindergarden time")
case 7...17:
    print("It`s school time")
case 18...21:
    print("You are student")
case 21...25:
    print("Working time")
case 25...45:
    print("Time to create the family")
case 46...120:
    print("Old man, yeap")
default:
    print("How old are you?")
}

//task 3: You have students FIO. If name starts with letters "A" or "O", adress him by his name, else if patronymic starts with letters "V" or "D", than address him by his first name and patronymic, else if surname starts with letters "E" or "Z", than address him by his surname, else address him by full name

let student = (firstName : "Ioann", surname : "Holysheet", patronymic: "Godblessyou")

let name = Array(student.firstName)
let surname = Array(student.surname)
let patronymic = Array(student.patronymic)

//let a = student.firstName
//a.starts(with: "I")

switch student {
case (student.firstName,_,_) where name[0] == "A" || name[0] == "O" :
    print("Address student by his name! - \(student.firstName)")
case (_,_,student.patronymic) where patronymic[0] == "V" || patronymic[0] == "D" :
    print("Address student by his first name and patronymic - \(student.firstName) \(student.patronymic)")
case (_,student.surname,_) where surname[0] == "E" || surname[0] == "Z" :
    print("Address student by his surname - \(student.surname)")
default:
    print("Address student by full name - \(student)")
}

switch student {
case (let name,_,_) where name.starts(with: "A") || name.starts(with: "O"):
    print("Address student by his name! - \(student.firstName)")
case (_,_, let patronymic) where patronymic.starts(with: "V") || patronymic.starts(with: "D"):
    print("Address student by his first name and patronymic - \(student.firstName) \(student.patronymic)")
case (_,let surname,_) where surname.starts(with: "E") || surname.starts(with: "Z") :
    print("Address student by his surname - \(student.surname)")
default:
    print("Address student by full name - \(student)")
}

//student.firstName.hasPrefix("I")


// task 4: Imagine that you are playing a sea battle. You have a some alived ships on the 10x10 field. You should create the switch operator which will take a tuple with a coordinate and give one of the options: miss, shot, kill

let ship1 = (x: 2, y: 1...4)
let ship2 = (x: 7...8, y: 2)
let ship3 = (x: 5, y: 4)
let ship4 = (x: 3...5, y: 7)
let ship5 = (x: 8, 6...9)

let rivalTurn = (x: Int.random(in: 1...10), y: Int.random(in: 1...10))

switch rivalTurn {
case (ship1.x, ship1.y):
    print("Ship 1 was shot")
case (ship3.x, ship3.y):
    print("Ship 3 was killed")
default:
    print("You are missed")
}
