import Foundation

// protocol extension

protocol RandomGenerator {
    func randoNumber() -> Int
}

extension RandomGenerator {
    func randomNumber() -> Int {
        Int.random(in: 1...10)
    }
}

struct UserData: RandomGenerator {
    func randoNumber() -> Int {
        Int.random(in: 20...30)
    }
}

var userData = UserData()
userData.randoNumber()

// protocol composition

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get set}
}

struct personData: Named, Aged {
    var name: String = "kim"
    var age: Int {
        get{
            return 20
        }
        set{
            tempAge = newValue
        }
    }
    var tempAge: Int = 0
}

// 두 프로토콜의 타입을 만족하는 것만 들어올 수 있다.
func showPersonData(person:Named & Aged) {
    print(person.name, person.age)
}

showPersonData(person: personData())

var persondata = personData()
persondata.name="lee"

showPersonData(person: persondata)
