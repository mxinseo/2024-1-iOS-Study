import Foundation

// Struct, Class

// 생성
// memberwise initializer (init 이 자동으로 생성)
struct Score1 {
    // property
    var myScore :Int
    var yourScore :Int
    
    //method
    func presentScore() {
        print(myScore, yourScore)
    }
}

// 변수에 담기. 구조체 안의 내용들이 모두 한번에 메모리에 올라간다.
var score1 = Score1(myScore: 10, yourScore: 40)


// class는 자체 initializer를 만들어줘야 한다.
class Score2 {
    var myScore :Int
    var yourScore :Int
    
    init(myScore: Int , yourScore: Int ) {
        self.myScore = myScore
        self.yourScore = yourScore
    }
    
    func presentScore() {
        print(myScore, yourScore)
    }
}

var score2 = Score2(myScore: 23, yourScore: 55)
