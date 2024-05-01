import Foundation

// Enum

// 생성.
enum GenderType : String {
    case man = "남자"
    case woman = "여자"
    case type1
    case type2
}

var genderType1 = GenderType.woman
var genderType2 : GenderType!

func showGender(type: GenderType) {
    switch type {
    case .man:
        print("남")
    case .woman:
        print("여")
    default:
        break
    }
}

showGender(type: .man)


// CaseIterable, 배열 처럼 사용 가능

enum Beverage: String, CaseIterable {
    case coffee
    case juice
    case tea
}

let beverage = Beverage.allCases
for beverage in Beverage.allCases {
    print(beverage.rawValue + "a")
}
func findBeverage(name: String) {
    Beverage.allCases.forEach { beverage in
        if beverage.rawValue == name{
            print("타입에 맞는 음료가 있음")
        }
    }
}
findBeverage(name: "coffee")


// 타입을 선택 + 값
enum Rectangle {
    case triangle(width: Int, height:Int, angle: Int)
    case circle(radius: Int)
}

var triangle = Rectangle.triangle(width: 100, height: 50, angle: 90)
triangle = .circle(radius: 10)

// enum 중 특정 한 case에 대한 작업
if case let Rectangle.triangle(width, height, angle) = triangle {
    print(width, height, angle)
}

// enum의 모든 case에 대한 작업
switch triangle {
    case .triangle(let width, let height, let angle):
        print(width, height, angle)
    case .circle(let radius):
        print(radius)
}
// 다른 형태
switch triangle {
    case let .triangle( width,  height,  angle):
        print(width, height, angle)
    case let .circle( radius):
        print(radius)
}
