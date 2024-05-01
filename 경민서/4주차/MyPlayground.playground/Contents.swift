import Foundation

// Closure 4

//escaping closure (탈출)
// 클로저가 언제 실행될지 모르고 밖에서 실행될 수 있는 상태일때


func showString(completion: () -> Void) {
    completion()
}

showString {
    print("a")
}

// 클로저 리스트 초기화
var myClosureList = [() -> Void]()
var myClosureList2: [() -> Void] = []

func showString2(completion: @escaping () -> Void) {
    myClosureList.append(completion)
}

// 실행할 내용 담기
showString2 {
    print("aa")
}
showString2 {
    print("aa")
}
showString2 {
    print("aa")
}
// 실제 실행
myClosureList.forEach { completion in
    completion()
}

// 이미 정의된 클로저
var names = ["lee", "kim", "jim", "min"]

names.sort(by: {(str1:String, str2:String) -> Bool in
    return str1 > str2
})

// 축약 형태(타입 생략)
names.sort { str1, str2 in
    return str1 > str2  // 정렬 기준
}

// 축약 형태(argument label 생략)
names.sort{ $0 < $1 }
names.sort(by: <)
