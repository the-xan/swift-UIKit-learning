// lesson - Subscripts
let array = ["a", "b", "c"]

// "[]" - сабскрипт (обращение к....)
array[0]
array[1]
array[2]


struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    var count : Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids[index - 2]
            default:
                return nil
            }
        }
        // в сеттере newValue - это дефотное значение
        set {
            let value = newValue ?? ""
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): kids[index - 2] = value
            default: break
            }
        }
    }
    // Сабскрипты поддерживают перегрузку!
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
}



var family = Family()
family.count

//пример реализованного сабскрипта через геттер
family[0]
family[1]
family[2]

//изменение значений через сеттер
family[0] = "Daddy"
family[0]

family[3] = "Buddy"
family[3, "the greatest"]!
