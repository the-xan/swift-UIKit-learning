// lesson 11 -> Closure (функция замыкания или по простому замыкание!)

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]
var count = 0

//Сортировка
func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    
    var filtered : [Int] = []
    count += 1
    for value in array {
        if f(value) {
            filtered.append(value)
        }
    }
    
    return filtered
}

// Чтобы не создавать еще одну функцию используют функции-замыкания
func compare(i:Int) -> Bool {
    return i % 2 == 0
}



// Эппл рекомендует писать функции замыкания вот так:
filterArray(array: numbers, f: { (i:Int) -> Bool in
    return i % 2 == 0
})

// MARK: 123
// FIXME: 123
// TODO: 123

// вариант упрощения - убрали "(i:Int) -> Bool" заменили на "i"
filterArray(array: numbers, f: {i in
    return i % 2 == 0
})

// вариант упрощения предыдущей записи - убрали "return"
let a1 =
filterArray(array: numbers, f: {i in i % 2 == 0})


// еще 1 вариант упрощения клоужеров - ($0 - это первый аргумент, $1 - это второй и.т.д) -> это самая распространенная форма т.к клоужеры это чаще всего лишь 1 операция
let a2 =
filterArray(array: numbers, f: {$0 % 2 == 0})

// если клоужер находится в конце - можем вынести функцию за скобки
let a3 =
filterArray(array: numbers) {$0 % 2 == 0}



// Простая сортировка c использованием циклов

let array = [1, 2, 3, 5, 7, 123]

let a4 =
filterArray(array: numbers) { value in
    
    for include in array {
       
        if include == value {
            return true
        }
    }
    return false
}



// но что если в нашем массиве будет 1000+ элементов? тогда циклы сильно нагрузят нашу систему! "а4" - можно оптимизировать

// создаем дикшинари и помещаем туда значения из массива
var dict = [Int : Bool]()

for value in array {
    count += 1
    dict[value] = true
}


let a5 =
filterArray(array: numbers) { value in
    count += 1
    return dict[value] != nil
}
 count
// Используя циклы суммарно получается 86 операций! При использовании дикшинари их всего 29, КАРЛ!!!!!

// a5 можно, кстати, запусать еще проще
let a6 =
filterArray(array: numbers) {dict[$0] != nil}



// Home work:
//taks 1:  Write a func that returns nothing and accept only once closure, which return nothing, and  accept nothing. This func should calculate from 1 to 10 in cycle, and then call closure. Add print to each turn of the cycle and to the closure. Follow the order of execution of commands

func simpleFunc(f: ()->()) {
    var sum = 0
    for i in 1...10 {
        sum += i
        print("\(i) - of cycle iteration")
    }
    print("Sum - \(sum)")
    f()
}

simpleFunc { print("It`s really work!") }


// task 2: Using the sorted array method, sort the int array in ascending and descending order. An example is shown in the manual

let numb = [2, 5, 3, 4, 1]


let ascendingNumbers = numb.sorted {$0 < $1}
print(ascendingNumbers)

let descendingNumber = numb.sorted {$0 > $1}
print(descendingNumber)

// task 3: Write func which accept array of int, closure and returns int. Closure should accept 2 int (1 of them is optional int) and return "yes" or "not". In the func itself, create an optional variable.

func someFunc(for array: [Int],by f: (Int,Int?) -> Bool ) -> Int {
    
    var opt : Int?
    
    for i in array {
        if f(i, opt) {
            opt = i
        }
    }
    return opt ?? 0
}








// ------------------------

let numbers1 = [1, 5, 10, 22, 32]

func sort(for array: [Int], by closure: (Int)-> Bool) -> [Int] {
    var arr : [Int] = []
    
    for element in array {
        if closure(element) {
            arr.append(element)
        }
    }
    return arr
}


let abc =
    sort(for: numbers1) {$0 == 2}


// task 4:

let randomString = Array("Hello, world!")






