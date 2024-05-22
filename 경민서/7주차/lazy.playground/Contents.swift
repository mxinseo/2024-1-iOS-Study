import Foundation

// lazy

// class, struct 안에 property var에 가능

class AClass {
    var name = ""
    var age = 0
    
    lazy var isAdult: Bool = age > 10 ? true : false
    
    lazy var isAdult2: Bool = checkAge()
    
    func checkAge() -> Bool {
        if age > 19 {
            return true
        } else {
            return false
        }
    }
}

var aClass = AClass()

aClass.isAdult // <- 이때 실행됨
aClass.age = 20
aClass.isAdult2 // <- 이때 실행됨
aClass.age = 10
aClass.isAdult2


// sequence
// filter map
// lazy sequence

let num = Array(1...100)
let calcnum = num.lazy.map {$0 * 10}
print(calcnum[50])

