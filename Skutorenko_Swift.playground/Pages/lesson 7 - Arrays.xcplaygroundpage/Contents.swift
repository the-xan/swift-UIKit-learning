//lesson 7 -> working with arrays
//task 1: Create array with the days of every month(ex. it will be 12 elements consist off number of days in the corresponding month. Using cycle for and this array:

// task 1.1: output to the console number of days of the month (without using name of the month)
let daysNumber = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for i in 0..<daysNumber.count {
    print("Numer of days - \(daysNumber[i])")
}

//task 1.2: also use another created array with name of the month for output to console name of the month + number of days,
let nameOfMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

if daysNumber.count == nameOfMonth.count {
    for i in 0..<nameOfMonth.count {
        print("In \(nameOfMonth[i]) - \(daysNumber[i]) days")
    }
} else {
    print("Arrays have diffrent numbers")
}


//task 1.3: do same think using array of tuples with params: name of the month, number of the days,
var tuple : [(month : String , days : Int)] = []

if daysNumber.count == nameOfMonth.count {
    for i in 0..<nameOfMonth.count {
        tuple.append((month: nameOfMonth[i], days: daysNumber[i]))
        print("In \(tuple[i])")
    }
} else {
    print("Arrays have diffrent numbers")
}

//task 1.4: do same think but output to the console days in reverse order
if daysNumber.count == nameOfMonth.count {
    for i in 0..<nameOfMonth.count {
        print(tuple[11-i])
    }
} else {
    print("Arrays have diffrent numbers")
}

//task 1.5: For a randomly selected date count sum days before this date from the begginning of the year
let needsMonth = "June"
var sumDays = 0

for (index, value) in nameOfMonth.enumerated() {
    if needsMonth == value {
        break
    }
    sumDays += daysNumber[index]
}
print("From the begginning of the year to the beginning \(needsMonth) - \(sumDays) days")


// task 2: Do the first task for lesson number 4 using arrays (Create array with optional Int params, and count the sum of the created array)

//task 2.1 For sum params use optional binding

let optionalArray = ["220", "191 - total score", "180", "250 - best score", "110 - are you mad?" ]

var sumOptionalInt1 = 0
/*
for (index, value) in optionalArray.enumerated() {
    if let sumAfterBinding = Int(optionalArray[index]){
        sumOptionalInt1 += sumAfterBinding
    } else {
        print("\(value) - can`t convert to Int!")
    }
}
print("total sum is - \(sumOptionalInt1)")
*/

for i in optionalArray {
    if let a = Int(i) {
        sumOptionalInt1 += a
    } else {
        print("\(i) - can`t convert to Int!")
    }
    print("sum in 2.1 task is - \(sumOptionalInt1)")
}



// task 2.2 For sum params use forced unwrapping

var sumOptionalInt2 = 0

for i in optionalArray {
    if Int(i) != nil {
        sumOptionalInt2 += Int(i)!
    } else {
        print("\(i) - can`t convert to Int!")
    }
}
print("sum in 2.2 task is - \(sumOptionalInt2)")

// task 2.3 use "??"

var sumOptionalInt3 = 0

for i in optionalArray {
    let c = Int(i) ?? 0
    sumOptionalInt3 += c
}
print("sum in 2.3 task is - \(sumOptionalInt2)")

// task 3: Create var String with alphabet and empty array with String

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var array : [String] = []

for i in alphabet {
    array.insert("\(i)", at: 0)
}
print("Reverse array is - \(array)")
