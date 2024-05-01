import Foundation

// Func Types


// () -> ()
// () -> Void
func sayHello() {
    print("Hello")
}


//(Int, Int) -> Int
func plus (a: Int, b: Int) -> Int {
    return a + b
}

func minus (a: Int, b: Int) -> Int {
    return a - b
}

let input1 = 4
let input2 = 5
var result = 0

func selectButton1(buttonStyle: String) {
    if buttonStyle == "+" {
        result = plus(a: input1, b: input2)
    } else if buttonStyle == "-" {
        result = minus(a: input1, b: input2)
    }
}

// 선택만하고 싶은데, 계산과 진행까지 더 진행되어 버림, 더 복잡해져 보임
// 이름에 충실한 기능만 만들고 싶다면

// 초기값이 없으므로 옵셔널로 지정
var calc: ((Int, Int) -> Int)?

// 실행이 아니라 기능만 담고 있는 것임. 작동 준비만 함
func selectButton2(buttonStyle: String) {
    if buttonStyle == "+" {
        calc = plus
    } else if buttonStyle == "-" {
        calc = minus
    }
}

// 선택한 연산 실행
func showResult() {
    calc?(input1, input2)
}
