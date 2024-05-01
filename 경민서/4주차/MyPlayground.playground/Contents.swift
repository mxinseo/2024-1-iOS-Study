import Foundation

// Closure 3

// Capturing Values

var str = "a"
var str2 = str
var str3 = str2

class SomeA {
    
}

class SomeClass {
    var b = 10
    var someA = SomeA()
    
    func someFunc(){
        print(b)
    }
    // 클로저 사용 : lazy = 접근할 때 만들어짐, 지연 저장
    lazy var myClosure: (()-> Void)? = {
        // 클로저에서 property를 사용할 때 self 키워드 필요
        // 클래스 통째로 참조하고 있다.
        print(self.b)
    }
    // capturing value. nil로 참조를 끊어줘야 함.
    // b를 value로 복사해서 가져옴
    lazy var myClosure2 = { [b] in
        print(b)
    }
    // capture list 사용. 레퍼런스 타입일 때, 약한 참조로 weak를 쓰면 참조할때 레퍼런스 카운트가 증가하지 않음
    lazy var myClosure3 = { [weak self] in
        print(self?.b ?? 0)
    }
    deinit {
        print("SomeClass deinit")
    }
}

// myClass가 SomeClass()를 참조하고 있다.
// 모든 참조를 끊어야 한다.
var myClass: SomeClass? = SomeClass()
var myClass2 = myClass
var myClass3 = myClass2


myClass2?.b = 11
myClass3?.b

// 클로저 참조 끊기
myClass?.myClosure
myClass?.myClosure = nil

myClass?.myClosure2


// 참조 끊기
// 모든 참조가 끊기면 deinit 된다.
myClass = nil
myClass2 = nil
myClass3 = nil


