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
    print((info as? User)?.birthday)
}
 

