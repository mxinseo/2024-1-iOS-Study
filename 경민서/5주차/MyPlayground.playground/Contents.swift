import Foundation

// Subscript

var names = ["lee", "kim"]
names[0]
names[1]

var colorValue = ["red": "100", "blue": "001"]
colorValue["red"] = "빨강"

struct Member {
    var name:String
    var age: Int
}

let member1 = Member(name: "kim", age: 20)
let member2 = Member(name: "lee", age: 25)
let member3 = Member(name: "mon", age: 22)
let member4 = Member(name: "seo", age: 32)

let members = [member1, member2, member3, member4]

class Group {
    var mambers = [Member]()
    
    // 데이터에 []로 바로 접근한다.
    subscript(index: Int) -> Member {
        return mambers[index]
    }
}

let group = Group()
group.mambers = [member1, member2, member3, member4]
group[0].name


// 나이대로 데이터 가져오기
class Group2 {
    
    enum AgeType {
        case _20s
        case _30s
    }
    
    var members = [Member]()
    
    // 데이터에 []로 바로 접근한다.
    subscript(ageGroup: AgeType) -> [Member] {
        get {
            var outputMembers = [Member]()
            for member in members {
                if ageGroup == ._20s && 20..<30 ~= member.age {
                    outputMembers.append(member)
                }
                if ageGroup == ._30s && 30..<40 ~= member.age {
                    outputMembers.append(member)
                }
            }
            return outputMembers
        }
    }
}

let group2 = Group2()
group2.members = [member1, member2, member3, member4]
group2[._20s]
