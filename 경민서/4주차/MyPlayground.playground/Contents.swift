import Foundation

// Closure 2

// Func + closure

func myfunc(closure: ()-> Void) {
    
}

myfunc {
    print("closure")
}

// func + closure 2개
func myfunc2(closure1: ()-> Void, closure2: ()->Void) {
    print("func")
    closure1()
    closure2()
}

// 2번째부터는 클로저 이름 생략이 불가
myfunc2 {
    print("closure1")
} closure2: {
    print("closure2")
}


// func + closure 3개
func myfunc3(closure1: ()-> Void, closure2: ()->Void, closure3: ()->Void) {
    print("func")
    closure1()
    closure2()
    closure3()
}

myfunc3 {
    print("closure1")
} closure2: {
    print("closure2")
} closure3: {
    print("closure3")
}

// func + 기본타입 + closure
func myFunc4(a:Int, closure: () -> Void) {
    print(a)
    closure()
}

myFunc4 (a:50) {
    print("ccc")
}

//closure + Int
func myFunc5(completion : (Int) -> Void) {
    print("func5...")
    let total = 100
    completion(total)
}

// 클로저 구분을 구현해도 되고
myFunc5 { total in
    print(total.description + "점")
}

// 이미 구현된 함수를 클로저로 넘겨도 된다.
func showScore(a:Int) {
    print((a+10).description+"점")
}
// 함수 자체를 넘겨준다.
myFunc5(completion: showScore)


//closure + return, 클로저에서 리턴된 값에서 작업을 하고 싶은 때
func myFunc6(completion:() -> Int) {
    print("myfunc6")
    completion() + 33
}

myFunc6{
    return 10
}

