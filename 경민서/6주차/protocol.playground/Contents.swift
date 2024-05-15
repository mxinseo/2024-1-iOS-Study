import Foundation

// protocol
// 규칙, 규격

protocol UserInfo {
    var userName: String {get set}
    var age: Int {get set}
    
    /// 나이를 출력할 때 사용
    func presentAge() -> String
}

class Member: UserInfo {
    var userName: String = ""
    
    var age: Int = 0
    
    func presentAge() -> String {
        age.description
    }
}

class Guest: UserInfo {
    var userName: String = ""
    
    var age: Int = 0
    
    func presentAge() -> String {
        age.description + "살"
    }
}

class User: UserInfo {
    var userName: String = ""
    
    var age: Int = 0
    
    var birthday = "5/3"
    
    func presentAge() -> String {
        "\(2022-age) 년생"
    }
}


let member = Member()
let guest = Guest()
let user = User()

let users: [UserInfo] = [member, guest, user]

users.forEach{ info in
    print(info.presentAge())
//    print((info as? User)?.birthday)
}
 

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on
    case off
    
    mutating func toggle() {
        if self == .on {
            self = .off
        } else {
            self = .on
        }
    }
}

var onoff = OnOffSwitch.off

onoff.toggle()

protocol SomeProtocol {
    init(age: Int)
}

class VIPmember : SomeProtocol {
    var age : Int
    
    required init(age: Int) {
        self.age = age
    }
}


// Delegation
enum AdultType {
    case adult
    case noAdult
}

protocol UserInfoDelegate: AnyObject {
    func isAdult(adultType: AdultType)
}

class UserA: UserInfoDelegate {
    func someFunc () {
        
    }
    func isAdult(adultType: AdultType) {
        print(adultType)
    }
    deinit {
        print("deinit UserA")
    }
}

class TypeChecker {
    weak var deletate: UserInfoDelegate?
    
    func checkDone() {
        deletate?.isAdult(adultType: .adult)
    }
}

var userA: UserA? = UserA()
let typechecker = TypeChecker()

typechecker.deletate = userA
typechecker.checkDone()

userA = nil
