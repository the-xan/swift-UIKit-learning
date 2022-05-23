//lesson 22 - Automatic Reference Counting (ARC)
// ARC - занимается только объектами класса
// Мои объекты не будут удалены до того момента, пока на одиного из объектов  есть 1 стронг ссылка
var playground = true

// Самый распространенный кейс - это когда у классов есть ссылки друг на друга - к примеру:
class Student {
    
    //weak ссылка всегда должна быть var и всегда ассоциируется с опциональными типами
    // если же teacher - это не опциональный тип то тогда используем unowned
    //unowned -может быть и let и var
    unowned var teacher : Teacher
    
    init(teacher: Teacher ) {
        self.teacher = teacher
    }
    
    
    deinit {
        print("goodbye Student")
    }
}

class Teacher {
    
    var student : Student!
    
    
    init() {
        self.student = Student(teacher: self)
    }
    
    deinit {
        print("goodbye Teacher")
    }
}

// Если объект класса Teacher объявим за конструктором if то этот объект не удалится из памяти
// var teacher : Teacher?

// тоже самое происходит и с closure - если они за условием то объекты класса не удаляются из памяти
var closure : (() -> ())?


if playground {
    // из-за скоупа видимости эти объекты удалятся
    
    let teacher = Teacher()
    
    /*
    if playground {
        var student = Student(teacher: teacher)
        teacher.student = student
        // но если мы попытаемся создать двунаправленную связь - тогда ни один из этих объектов не будет уничтожен (потому что оба указывают друг на друга сильной ссылкой)
        // если мы одну из ссылкок сделаем weak (т.к сейчас это опциональный тип) - то будут уничтожены оба экземпляра класса
        student.teacher = teacher
    }
    */
    
    // чтобы closure не оставлял стронг ссылки - можем использовать capthure list и объект student в ней с ключевым словом unowned или weak - если это опшинал тайп
    let student = teacher.student
    closure = {
        [weak student] in
        print(student!)
    }
    
    
    
    print("exit playground")
    
}

// разберем клоужеры
var x = 10
var y = 20

// closure - захватывает ссылки на переменные
// Если хотим в этом closure зафиксировать изначальные данные (10 и 20 к примеру) - то должны использовать capthure list (список захваченных значений)
// Важно знать что при захвате значений через closure, он держит их сильной ссылкой
var closure1 : () -> () = {
    // в [] можем указать какие именно значения захватываем [x, y] (также можно захватить классы)
    // обязательно capthure list надо написать до in
    [x, y] in
    print("closure1 захватил - \(x) \(y)")
}

// этот closure будет ссылаться на крайнее значение x и y
var closure2 : (Int) -> Int = { (a: Int) -> Int in
    print("closure2 захватил - \(x) \(y)")
    return a
}

closure1()

x = 30
y = 40

closure2(1)








print("end")
