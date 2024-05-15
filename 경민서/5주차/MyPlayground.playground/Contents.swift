import Foundation


// property

var name = ""

class MyClass {
    var name = ""
}

struct MyStruct {
    var name = ""
}

let myClass = MyClass()
myClass.name = "kim"


let myStruct = MyStruct()
//myStruct.name = "kim". // error


// lazy stored property
class MyClass2{
    lazy var name = ""
    var age = 20
    lazy var isAdult = age > 19 ? true : false
    lazy var names = ["kim", "lee"]
    
//    lazy var nameCount = names.count // logical error
    func nameCunt2() -> Int {
        return name.count
    }
}

var myClass2 = MyClass2()

// computed property
class MyProfile {
    var age = 20
    
    // computed property, func처럼 작동
    var isAdult: Bool {
        return age > 19 ? true : false
    }
    
    var isAdult3: Bool {
        get {
            !tempIsAdult
        }
        set {
            tempIsAdult = newValue // 새로운 값이 들어오는 순간 tempIsAdult에 저장해줌
        }
    }
    
    var tempIsAdult = false
}
