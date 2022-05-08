// lesson - Subscripts(Сабскрипты)
let array = ["a", "b", "c"]

// "[]" - сабскрипт (обращение к экземпляру через квадратные скобки по индексу)
// Сабскрипты можно применять к классам, структурам, энумам
array[0]
array[1]
array[2]


struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    // если в computer properties только 1 геттер его можно не указывать
    var count : Int {
        return 2 + kids.count
    }
    
    // то же что и ->
    /*
     var count : Int {
     get {
     return 2 + kids.count
     */
    
    
    // В сабскриптах используюется геттеры и сеттеры как в computer properties
    // Если в сабскриптах используется только геттер - его можно не указывать
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
    // Сабскрипты поддерживают перегрузку!(overloading) -> можем использовать одно и тоже название метода но с разными переменными
    // Если в сабскриптах используется только геттер - его можно не указывать, как в примере ниже
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


//Использование сабскрипта для дополнительной операции - в нашем случае мы добавим значение "the greatest" kid1
family[3] = "Buddy"
family[3, "the greatest"]!




// еще 1 пример реализации шахматного поля через сабскрипт
struct Field {
    // можно использовать любой сторейдж
    var dict = [String : String]()
    
    func keyForColumn(_ column: String, andRow row: Int) -> String {
        return column + String(row)
    }
    
    
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[keyForColumn(column, andRow: row)]
        }
        set {
            dict[keyForColumn(column, andRow: row)] = newValue
        }
    }
}

var field = Field()
field["a", 5]
field["a", 5] = "X"
field["a", 5]


//Homework ->
/*
 Крестики нолики (Средний уровень)

 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле

 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.

 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.

 4. Если хотите, добавте алгоритм, который вычислит победителя
 */

