import Foundation

// Generic
// 로직은 같은데 그 안에 타입만 바뀌는 경우

// Numeric -> 숫자인 경우,Comparable -> 비교 가능한
func plus<T>(a: T, b: T) -> T where T:Numeric, T:Comparable {
    if a > b {
        print("a")
    }
    return a + b
}

plus(a: 20, b: 40)

// stack

class Stack<T> {
    var items = [T]()
    
    func push(str: T) {
        items.append(str)
    }
    
    func pop() -> T {
        items.removeLast()
    }
}

// stack + generic + protocol

protocol StackProtocol {
    associatedtype T // 제네릭 타입 선언
    func push(str: T)
    func pop() -> T
}

class Stack2<T>: StackProtocol {
    var items = [T]()
    
    func push(str: T) {
        items.append(str)
    }
    
    func pop() -> T {
        items.removeLast()
    }
}

class Stack3: StackProtocol {
    
    // 내부에서 타입을 정의하는 경우
    typealias T = String
    
    var items = [T]()
    
    func push(str: T) {
        items.append(str)
    }
    
    func pop() -> T {
        items.removeLast()
    }
}
