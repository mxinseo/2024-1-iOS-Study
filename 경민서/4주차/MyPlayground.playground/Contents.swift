import Foundation

// Closure
// 함수와 개념이 같음

// Function (Named Closure)
// (Int, Int) -> Int
func plus(a:Int, b:Int)->Int {
    return a + b;
}

// Closure (Unnamed Closure)
// 이름이 없는 형태
// {} 대괄호가 클로저임을 알려줌
// 구현부는 in으로 구분
//{ (a:Int, b:Int) -> Int in
//    return a + b
//}

// 변수나 상수에 Closure를 대입
// (Int, Int) -> Int
var myClosure = { (a:Int, b:Int) -> Int in
    return a + b
}

// 클로저는 함수처럼 argument label를 사용할 수 없다.
plus(a: 10, b: 20)
myClosure(10, 20)

// Function의 parameter에 closure에 넣어서 사용하는 방식
func f1 () {
    print("작업중...")
    print("작업중...")
    
    f2()
}
func f2 () {
    print("작업완료처리")
}

// 의도가 불분명해 보인다.
//f1()
//f2()


func f10 (myClosure: ()->Void) {
    print("작업중...")
    print("작업중...")
    
    myClosure() // 파라미터로 받은 클로저 실행
}
func f20 () {
    print("작업완료처리")
}

// f10에 f20 호출이 전달됨. 실행 로직이 예상이 된다.
f10(myClosure: {() -> Void in f20()})

// () -> Void 생략 가능
f10(myClosure: {f20()})

// 파라미터 이름 생략 가능
f10 {
    f20()
}
