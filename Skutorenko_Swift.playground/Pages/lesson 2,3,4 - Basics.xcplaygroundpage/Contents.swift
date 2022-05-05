// lesson 2 -> working with BASIC TYPES in SWIFT

// task 1: Output the min and max values of the basic types to the console
let maxInt = Int.max
let minInt = Int.min
print("Maximum value of Int is: \(maxInt)")
print("Minimum value of Int is: \(minInt)")

let maxInt8 = Int8.max
let minInt8 = Int8.min
print("Maximum value of Int8 is: \(maxInt8)")
print("Minimum value of Int8 is: \(minInt8)")

let maxInt16 = Int16.max
let minInt16 = Int16.min
print("Maximum value of Int16 is: \(maxInt16)")
print("Minimum value of Int16 is: \(minInt16)")

let maxInt32 = Int32.max
let minInt32 = Int32.min
print("Maximum value of Int32 is: \(maxInt32)")
print("Minimum value of Int32 is: \(minInt32)")

let maxInt64 = Int64.max
let minInt64 = Int64.min
print("Maximum value of Int64 is: \(maxInt64)")
print("Minimum value of Int64 is: \(minInt64)")

// task 2: Create 3 consts with Int, Float, Double types, then create another 3 consts with the same types: Int, Float, Double. Each of them is the sum of the first three, but with its own type
let firstIntConst = 24
let secondFloatConst : Float = 3.141
let thirdDoubleConst = 33.01

let sumInt = firstIntConst + Int(secondFloatConst) + Int(thirdDoubleConst)
let sumFloat = Float(firstIntConst) + secondFloatConst + Float(thirdDoubleConst)
let sumDouble = Double(firstIntConst) + Double(secondFloatConst) + thirdDoubleConst

// task 3: Compare the Int result of the sum with the Double and output the report to the console

if Double(sumInt) > sumDouble {
    print("The sum of Int greater than Double")
} else {
    print("The sum of Double greater than Int")
}


// lesson 3 -> Tuples
// task 1: Create tuple with the 3 params: max push-ups, max pull-ups, max sit-downs. Fill tuple with your achievements, then output it via print()

let myAchievements = (pushUps: 24, pullUps: 15, sitDowns: 60)
let myAchievements2 : (pushUps: Int, pullUps : Int, sitDowns: Int) = (22, 11, 70)

print("My achievements is: \(myAchievements)")
print("My achievements is: \(myAchievements2)")

// task 2: Make 3 outputs to the console for each params, get values by index and by parameter
print("Output to console by index: pull-ups - \(myAchievements.1), puss-ups - \(myAchievements.0), sit-downs - \(myAchievements.2)")
print("Output to console by parameter: pull-ups - \(myAchievements.pullUps), puss-ups - \(myAchievements.pushUps), sit-downs - \(myAchievements.sitDowns)")

//task 3: Create the same tuple for another person (ex. wife or fiend). Use a var to change values in first tuple to the second tuple

var myWifeAchievements = (pushUps: 7, pullUps: 5, sitDowns: 40)

myWifeAchievements.pushUps = myAchievements.pushUps
myWifeAchievements.pullUps = myAchievements.pullUps
myWifeAchievements.sitDowns = myAchievements.sitDowns
print("New Wife`s achievement is: \(myWifeAchievements)")

//task 4: Create third another tuple with same params, but values of new tuple it`s diff with 1 and 2 tuples values

let thirdTuple = (pushUps: myAchievements.0 - myWifeAchievements.0, pullUps: myAchievements.1 - myWifeAchievements.1, sitDowns: myAchievements.2 - myWifeAchievements.2 )
print("Third tuple values: \(thirdTuple)")


// lesson 4 -> Optional types
//taks 1: Create 5 string const-s, some constants include numbers, other contain words + numbers. Find the sum of all these constants by bringing them to Int (use optional binding and forced unwrapping)

let ageTim = "24"
let ageDina = "21 years old"
let ageMaria = "18 years old"
let ageFil = "23"
let ageKarim = "27 years old"

var sum1 = 0

//lets use optional binding
if let firstAction = Int(ageTim) {
    sum1 += firstAction
} else {
    print("it`s nil result")
}

if let secondAction = Int(ageDina) {
    sum1 += secondAction
} else {
    print("it`s nil result")
}

if let thirdAction = Int(ageMaria) {
    sum1 += thirdAction
} else {
    print("it`s nil result")
}

if let fourthAction = Int(ageFil) {
    sum1 += fourthAction
} else {
    print("it`s nil result")
}

if let fifthAction = Int(ageKarim) {
    sum1 += fifthAction
} else {
    print("it`s nil result")
}

print("Total sum in first variant is: \(sum1)")

// lets use forced unwrapping
var sum2 = 0

if Int(ageTim) != nil {
     sum2 += Int(ageTim)!
} else {
    print("it`s nil result")
}

if Int(ageDina) != nil {
     sum2 += Int(ageDina)!
} else {
    print("it`s nil result")
}

if Int(ageMaria) != nil {
     sum2 += Int(ageMaria)!
} else {
    print("it`s nil result")
}


if Int(ageFil) != nil {
     sum2 += Int(ageFil)!
} else {
    print("it`s nil result")
}

if Int(ageKarim) != nil {
     sum2 += Int(ageKarim)!
} else {
    print("it`s nil result")
}

print("Total sum in second variant is: \(sum2)")


if sum1 == sum2 {
    print("The values are the same")
} else {
    "Ops...something goes wrong!"
}

//task 2: From server comes tuple with 3 params: statusCode(Int), message(Str), errorMessage(Str). In this case "statusCode" always include parameter. if statusCode is in the range from 200 < 300 - succes message is displayed, else output an errorMessage

var serverResponse : (statusCode : Int , message : String? , errorMessage : String?) = (0, nil , nil)

serverResponse.statusCode = 202

if serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 {
    serverResponse.message = "Your account has been created successfully"
    print(serverResponse)
} else {
    serverResponse.errorMessage = "Please fill the required fields correctly"
    print(serverResponse)
}

//task 3: Create 5 tuples with 3 params: name , carsId , score. When this tuples was created there should be empty. After creation , set a name for each student. For some, set the car number, for some set the result of the control. Then output to the console: - students name, does he have a car, if so what number of car, was there a test, if so what is the score


var firstStudent : (name : String, carsId : String? , score : Int?)
var secondStudent : (name : String, carsId : String? , score : Int?)
var thirdStudent : (name : String, carsId : String? , score : Int?)
var fourthStudent : (name : String, carsId : String? , score : Int?)
var fifthStudent : (name : String, carsId : String? , score : Int?)

firstStudent.name = "Alex"
firstStudent.carsId = "322CEA02"
firstStudent.score = 10

print(firstStudent)

//
// lesson 7: Arrays

let constArray = ["a", "b", "c", "d"]

//Вывести в консоль число элементов в массиве
constArray.count

//инициализируем массив с типом String
var array = [String]()

if array.isEmpty {
    print("This array is empty")
}

array += constArray

// можем к массиву строк добавить 1 элемент в конец можно либо так
array += ["e"]

// либо так
array.append("f")

var array2 = array

// изменить значение в массиве можно по индексу
array2[0] = "1"

//array[1...4] = ["0"]

// вставить элемент в определенное место в массиве можно так
array.insert("-", at: 3)

// удалить элемент из массива можно
array.remove(at: 3)

// let test = [Int](repeating: 100, count: 3)
let money = [100, 1, 5, 20, 1, 50, 1, 1, 20]

money.count

// посчитать сумму масива можно так
/*
var sum = 0

  for (index, value) in money.enumerated() {
    print("i = \(index) value\(value)")
    sum += value
}

// либо так
sum = 0
for i in 0..<money.count {
   print("i = \(i)")
    sum += money[i]
}
sum

//или так
sum = 0
for i in money {
    sum += i
    print(sum)
}
*/

//lesson 7 -> Arrays
//task 1: Create array with the days of every month(ex. it will be 12 elements consist off number of days in the corresponding month. Using cycle for and this array: - output to the console number of days of the month (without using name of the month) - also use another created array with name of the month for output to console name of the month + number of days, - do same think using array of tuples with params: name of the month, number of the days, - do same think but output to the console days in reverse order

let daysNumber = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

let abc = daysNumber[0]

for i in 0..<daysNumber.count {
    print("Numer of days - \(daysNumber[i])")
}

let nameOfMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

if daysNumber.count == nameOfMonth.count {
    for i in 0..<nameOfMonth.count {
        print("In \(nameOfMonth[i]) - \(daysNumber[i]) days")
    }
} else {
    print("Arrays have diffrent numbers")
}

var tuple1 : [(month : String , days : Int)] = [("abc", 123)]

print(tuple1[0])


var tuple : [(month : String , days : Int)] = []


if daysNumber.count == nameOfMonth.count {
    for i in 0..<nameOfMonth.count {
        tuple.append((month: nameOfMonth[i], days: daysNumber[i]))
        print("In \(nameOfMonth[i]) - \(daysNumber[i]) days")
        
        
    }
} else {
    print("Arrays have diffrent numbers")
}

print("New tuple is - \(tuple)")

