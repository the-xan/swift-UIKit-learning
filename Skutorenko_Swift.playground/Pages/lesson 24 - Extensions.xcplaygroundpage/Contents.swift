//lesson 24 - Extensions -> Расширения

extension Int {
    
    var isEven : Bool {
        return self % 2 == 0
    }
    
    var isOdd : Bool {
        return !isEven
    }
    
    // nested type - вложенный тип
    // Вложенные типы правильно создавать тогда, когда кроме этой структуры\класса и.т.д нигде использоваться этот тип не будет
    enum EvenOrOdd {
        case Even
        case Odd
    }
    
    var evenOrOdd : EvenOrOdd {
        return isEven ? .Even : .Odd
    }
    //  возведение в степень
    func pow(_ value: Int) -> Int {
        var temp = self
        for _ in 1..<value {
           temp *= self
        }
        return temp
    }
    
    // возведение в степень с последующей перезаписью в новое значение
    mutating func powTo(_ value: Int) {
        self = pow(value)
    }
    
    var binaryString : String {
        var result = ""
        for i in 0..<8 {
            result = String(self & (1 << i) > 0) + result
        }
        return result
    }
}

extension String {
    init(_ value: Bool) {
        self.init(value ? 1 : 0)
    }
}



// расширение на вложенный тип  enum EvenOrOdd
extension Int.EvenOrOdd {
    var string : String {
        switch self {
        case .Even: return "even"
        case .Odd: return "odd"
        }
    }
}



var a = 5

if a % 2 != 0 {
    print("a")
}

if a.isOdd {
    print("a")
}

// Проверка на четность или не четность
a.evenOrOdd.string

// степень числа
a.pow(2)

a.powTo(4)

//
a.binaryString


let s = "Hello, World!"


