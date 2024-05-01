# 섹션 1.25 - 섹션 1.30

기한: 05/02/2024
Description: 5주차 세미나
주차: 4

# 수강 강의

- [x]  [25. Closure_1 25 : 00](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133591)
- [x]  [26. Closure_2 19 : 00](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133592)
- [x]  [27. Closure_3 27 : 02](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133593)
- [ ]  [28. Closure_4 17 : 37](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133594)
- [ ]  [29. Enum 27 : 50](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133595)
- [ ]  [30. Class vs Struct 38 : 37](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133596)

# 1-25. Closure_1

---

### 일반적인 함수의 형태

```swift
// Function (Named Closure)
// (Int, Int) -> Int
func plus(a:Int, b:Int)->Int {
    return a + b;
}
```

### 클로저 형태 1)

```swift
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
```

```swift
// 클로저는 함수처럼 argument label를 사용할 수 없다.
plus(a: 10, b: 20)
myClosure(10, 20)
```

### 클로저 형태 2)

```swift
// Function의 parameter에 closure에 넣어서 사용하는 방식

func f10 (myClosure: ()->Void) {
    print("작업중...")
    print("작업중...")
    
    myClosure() // 파라미터로 받은 클로저 실행
}
func f20 () {
    print("작업완료처리")
}
```

### 클로저를 사용하는 이유

```swift
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
```

```swift
func f10 (myClosure: ()->Void) {
    print("작업중...")
    print("작업중...")
    
    myClosure() // 파라미터로 받은 클로저 실행
}
func f20 () {
    print("작업완료처리")
}
```

### 클로저 형식 생략

```swift
// f10에 f20 호출이 전달됨. 실행 로직이 예상이 된다.
f10(myClosure: {() -> Void in f20()})

// () -> Void 생략 가능
f10(myClosure: {f20()})

// 파라미터 이름 생략 가능
f10 {
    f20()
}
```

# 1-26. Closure_2

---

### 함수+클로저의 다양한 형태

```swift
// Func + closure

func myfunc(closure: ()-> Void) {
    
}

myfunc {
    print("closure")
}
```

```swift
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

```

```swift
// func + 기본타입 + closure
func myFunc4(a:Int, closure: () -> Void) {
    print(a)
    closure()
}

myFunc4 (a:50) {
    print("ccc")
}
```

```swift
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
```

```swift
//closure + return, 클로저에서 리턴된 값에서 작업을 하고 싶은 때
func myFunc6(completion:() -> Int) {
    print("myfunc6")
    completion() + 33
}

myFunc6{
    return 10
}
```

# 1-27. Closure_3

---

reference type (class, function,, closure)

- 참조

value type (Int, String, Array, Dictionary, Struct)

- 값을 복제해서 사용

```swift
var str = "a"
var str2 = str
var str3 = str2
```

클래스들이 100번 호출되면 100번 모두 해제해줘야 한다. 

클래스 안에서 선언된 클로저도 클래스를 참조하고 있기 때문에 클로저도 해제해 줘야 한다.

[Swift) 클로저(Closure) 정복하기(3/3) - 클로저와 ARC](https://babbab2.tistory.com/83)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2025%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2030%2008556c8698f54cba90c52b3ff6be6b1e/Untitled.png)

```swift
class SomeClass {
    var b = 10
    func someFunc(){
        print(b)
    }
    // 클로저 사용 : lazy = 접근할 때 만들어짐, 지연 저장
    lazy var myClosure: (()-> Void)? = {
        // 클로저에서 property를 사용할 때 self 키워드 필요
        // 클래스 통째로 참조하고 있다.
        print(self.b)
    }
    deinit {
        print("SomeClass deinit")
    }
}
```

```swift
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

// 참조 끊기
// 모든 참조가 끊기면 deinit 된다.
myClass = nil
myClass2 = nil
myClass3 = nil
```

### weak

매번 nil을 주는 것은 번거로우니

value로 복제하여 사용하는 방법이 있다.

```swift
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
```

# 1-28. Closure_4

---

### escaping closure (탈출)

클로저가 언제 실행될지 모르고 밖에서 실행될 수 있는 상태일때

```swift
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
```

### 이미 정의된 클로저

```swift
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
```

# 1-29. Enum

---

```swift
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
```

### CaseIterable

배열처럼 사용이 가능하다

```swift
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
```

### case에서 값을 가지는 경우

```swift
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

```

# 1-30. Class vs Struct

---

### Struct

memberwise initializer (init 이 자동으로 생성)

멤버 = property

함수 = method

```swift
struct Score1 {
    var myScore :Int
    var yourScore :Int
    
    func presentScore() {
        print(myScore, yourScore)
    }
}

// 변수에 담기. 구조체 안의 내용들이 모두 한번에 메모리에 올라간다.
var score1 = Score1(myScore: 10, yourScore: 40)
score1.myScore = 100
score1.presentScore()
```

### Class

```swift
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
score2.yourScore = 50
score2.presentScore()
```

### Memory

1. value type (복사)
    1. struct, enum, tuple, …
    2. 원본과 같은 값이 여러개 생성이 된다.
2. Reference type (참조)
    1. class, func, closure
    2. 원본을 참조한다.

### 특징

1. Value type
각각 따로 관리되기 때문에 원본에 대한 관리가 필요없음.
덩치가 크면 복사에 많은 메모리 사용.
-> Copy on Write(COW)로 성능 저하 방지. (실제로 값이 바뀌게 될때 비로소 복제함)
2. Reference type
원본에 대한 관리 필요 (멀티 스레드 환경에서 오류발생 가능성)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2025%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2030%2008556c8698f54cba90c52b3ff6be6b1e/Untitled%201.png)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2025%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2030%2008556c8698f54cba90c52b3ff6be6b1e/Untitled%202.png)

![상황에 따라 스택 대신에 힙영역에 저장될 수 있다.](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2025%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2030%2008556c8698f54cba90c52b3ff6be6b1e/Untitled%203.png)

상황에 따라 스택 대신에 힙영역에 저장될 수 있다.

### 메모리 영역

**Text Segment (code Segment)**
execution code

**Data Segment**
Global, static
Program lifecycle

**Stack Segment**
Automatically allocated and released
Value Type (struct)
Small memory
Fast
LIFO

**Heap Segment**
Allocated and released by programmer
Reference Type (class)
Large memory
Slow
Tree