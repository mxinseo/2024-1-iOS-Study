import Foundation

// class and struct

// 1 oz = 29.5ml
// 1ml = 0.033oz

//customizing initialization
struct UnitConversion {
    var oz: Double
    var ml: Double
    
    init(oz: Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml: Double) {
        self.ml = ml
        self.oz = ml / 29.5
    }
}

var unitConversion = UnitConversion(ml: 1)
unitConversion.ml
unitConversion.oz

var unitConversion2 = UnitConversion(oz: 1)
unitConversion2.ml
unitConversion2.oz

// - convenience initailizer
// - 조건 → 내부에서 다른 init을 반드시 실행

class Profile{
    var name : String
    var age: Int
    var isAdult: Bool
    
    // Designated initializer
    init(name: String, age:Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true: false
    }
    
//    init(age:Int) {
//        self.name = "" // 빈 스트링
//        self.age = age
//        self.isAdult = age > 19 ? true: false
//    }
    
    convenience init(age: Int) {
        self.init(name: "", age: age)
    }
    
    func showName() {
        print(name)
    }
    
}

// 상속
class MemberProfile: Profile {
    override init(name: String, age: Int) {
        let newName = name + "님"
        super.init(name: newName, age: age)
    }
    
    override func showName() {
        print(name + "하이")
    }
}


let member = MemberProfile(name: "kim", age: 20)
member.showName()


// Required init
// 상속
class BaseView {
    init(frame: CGRect) {
        
    }
    
    required init(coder: NSCoder) {
        
    }
}

class RedView: BaseView {
    init() {
        let frame = CGRect()
        super.init(frame: frame)
    }
    override init(frame: CGRect) {
        let frame = CGRect()
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// Failable initializer
//init?

class MyClass {
    init?(type: String) {
        if type == "" {
            return nil
        }
        print("success", type)
    }
}
