# 섹션 1.14 - 섹션 1.24

기한: 04/04/2024
Description: 4주차 세미나
주차: 3

# 수강 강의

- [x]  1-14. Optional_1
- [x]  1-15. Optional_2
- [x]  1-16. Optional_3
- [x]  1-17. Operators_1
- [x]  1-18. Operators_2
- [x]  1-19. Unicode
- [x]  1-20. ControlFlow - for in
- [x]  1-21. ControlFlow - while
- [x]  1-22. ControlFlow - switch
- [x]  1-23. Function_1
- [x]  1-24. Function_2

# 1-14. Optional_1

---

### Optional Type

- 값이 있을 수도 있고 없을 수도 있는 것
- 타입 옆에 ?를 붙여 정의한다.
- nil을 사용하려면 옵셔널을 사용해야 함

```swift
import Foundation

// Optional Type
// 정의 - 값이 있을 수도 있고 없을 수도 있다.
// 표현 - ?
// 값이 없다라는 개념 - nil (null)

var age1: Int = 0

// 옵셔널만 nil이라 할 수 있음
var age2: Int? = nil

if age2 == nil {
    print("나이값을 확인할 수 없다.")
}

var str1: String = ""
var str2: String? = nil

if str2 == nil {
    print("글자를 쓰지 않았다.")
}

var myFavorite: [String]?

// http status code
if myFavorite == nil {
//    print("내 즐겨찾기 개수가 0개다. ")
    print(("내 즐겨찾기 개수를 받아오는데 실패했다."))
}
```

### 0(””) 과 nil의 차이

- 0(””) : 값이 세팅됨
- nil: 값이 세팅조차 되지 않음

따라서 옵셔널의 경우만 nil을 사용할 수 있고 0(””)과 nil을 혼용하면 안된다. 

# 1-15. Optional_2

---

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2014%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2024%20f9ac38d35b454e47b9c236aa7ce02a65/Untitled.png)

변수가 wrapping되어 있어 사용할 수 없다는 에러가 발생한다.

옵셔널을 없애라 = unwrapping

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2014%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2024%20f9ac38d35b454e47b9c236aa7ce02a65/Untitled%201.png)

### force unwrapping

- 강제로 unwrapping, 변수 옆에 !를 적는다.
- nil이 절대 안 된다고 확신이 있는 경우만 사용해야 한다.
- 중간에 nil이 될 가능성이 있는 경우 앱이 죽으므로 절대 사용해서는 안 된다.

### nil coalesing

- nil일 경우 대체하는 수를 정의한다.
- ?? 기호로 정의한다.

```swift
import Foundation

// 옵셔널

// 문법, unmapping

// 옵셔널로 래핑되어 있다. (wrap)
var myAge1: Int? = 20
var myAge2: Optional<Int> = 40

// force unwrapping (강제)
var sum = myAge1! + 1

// 주의사항 (확신이 있을떄만 사용)
//myAge1 = nil
//myAge1!

// nil coalesing
// nil이면 대체하는 수를 적음
myAge1 = nil
var sum2 = (myAge1 ?? 0) + 1

```

# 1-16. Optional_3

---

### Optional Binding

옵셔널 타입의 값을 사용할 때는 옵셔널을 해제하여 사용해야 하고

주의할 점은 nil이 지정된 경우엔 절대 해제하면 안 된다. 

### if let(var)

값이 있는 경우 상수에 할당된 값을 출력하게 되면서 옵셔널이 벗겨진다.

if let 에서 선언한 let은 지역변수 즉 { } 해당 스코프를 벗어나지 못한다.

### guard-let

조건식이 true이면 실행한다. 

Optional Binding 기능을 포함하고 있다. 

```swift
import Foundation

// 옵셔널로 래핑되어 있다. (wrap)
var myAge1: Int? = 20
var myAge2: Optional<Int> = 40

// if Statements

if myAge1 == nil {
    // nil일 때 처리
}

if myAge1 != nil {
    // nil이 아닐 때 처리
}

// Optional Binding
// if let(var)

var sum = 0

if let age = myAge1 {
    sum = age + 1
}

// guard let(var)
guard let age = myAge1 else {
    // 중단
//    return
    fatalError("nil error")
}
```

# 1-17. Operators_1

---

```swift
import Foundation

// Operators, 연산자

// Assignment Operators (할당), =
var age = 10

// arithmetiv Operator
1+2
1*2
1-2
1/2
1.0/2.0

var str1 = "Hello"
var str2 = "world"

str1 + " " + str2

// Array
var arr1 = ["a", "b", "c"]
var arr2 = ["x", "y", "z"]

var newArr = arr1 + arr2
newArr

// Remainder Operator, Int 값만 가능

var num1 = 5
var num2 = 3
num1 % num2

var num3: Double = 8
var num4: Double = 3

num3 / num4
// 2.666 -> 3 몫이 가까운 정수로 변환됨

num3.truncatingRemainder(dividingBy: num4)  // 일반적인 나머지
num3.remainder(dividingBy: num4)            // 몫이 가까운 정수로 변환됨

// Compound Assginment
var a = 10
a += 1
a -= 1
```

# 1-18. Operators_2

---

```swift
import Foundation

// Operators, 연산자

// Comparision Operators, 비교
// != == >= <= < >

var a = 20
var b = 10
a == b

var c = ["aaa", "bbb"]
var d = ["bbb", "aaa"]
c == d

if a != b {
    print("true")
} else {
    print("false")
}

// Ternary Conditional Operator
// 삼항 연산자
var condition = a > b
var trueValue = "true"
var falseValue = "false"

condition ? trueValue : falseValue

// Range Operator
// 범위 0...5

// for-in loop

for index in 0..<5 {
    print(index)
}

let names = ["kim", "lee", "min"]
for index in 0..<names.count {
    print( names[index] )
}

// one sided ranges
for index in names[1...] {
    print(index)
}

// logical Operator

let isGreen = true
let isRed = true

// logical and
if isGreen && isRed && true && false && false {
    print("both true")
}

// logical or
if isGreen || isRed {
    
}

// logical not
if (!isRed == true) {
    print("not red")
}
```

# 1-19. Unicode

---

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2014%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2024%20f9ac38d35b454e47b9c236aa7ce02a65/Untitled%202.png)

```swift
import Foundation

// unicode
// 문자 -> 내부적으로 특정한 코드값(16진수)

"a"
"\u{61}"

// 숫자만 입력
let inputValue = "4"

if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자")
} else {
    print("숫자가 아님")
}

// 한글만 입력
UnicodeScalar("가")
// 44,032 -> 16진수
String(44032, radix: 16)
// "ac00"

UnicodeScalar("힣")
// 44,032 -> 16진수
String(55203, radix: 16)
// "d7a3"

if inputValue >= "\u{ac00}" && inputValue <= "\u{d7a3}" {
    print("한글")
} else {
    print("한글 아님")
}

```

# 1-20. ControlFlow - for in

---

### 배열의 인덱스도 가져오기 enumerated()

```swift
for (index, name) in names.enumerated() {
    print(name, index)
}
```

### 불필요한 반복 건너뛰기, stride()

```swift
for minute in stride(from: 0, to: minutes, by: 5) {
        print(minute)
}
```

```swift
import Foundation

// ControlFlow (흐름 제어) - for in loops

let names = ["kin", "lee", "min"]
let numbers = [1,5, 3, 35,3,65]

//for name in names{
//    print (name)
//}

//for number in numbers {
//    print (number)
//}

let myRange1 = (0...5)
let myRange2 = (0..<6)

// 인덱스도 가져오기
//for (index, name) in names.enumerated() {
//    print(name, index)
//}

// 5단위로 출력, 60번 반복
let minutes = 60
for minute in 0..<minutes {
    if minute % 5 == 0 {
        print(minute)
    }
}

// 5단위로 출력, 12번 반복, 쓸데없는 반복 제외
//0..<minutes
for minute in stride(from: 0, to: minutes, by: 5) {
        print(minute)
}

//0...minutes
for minute in stride(from: 0, through: minutes, by: 5) {
        print(minute)
}
```

# 1-21. ControlFlow - while

---

### Int.random(in: )

```swift
import Foundation

// ControlFlow (흐름 제어) - while
// 반복 끝이 정해지지 않을 떄 사용

// 주사위 (1~6)
// 주사위 홀수 -1
// 주사위 짝수 +1
// 목표 10까지 도달

var dice = 0
var position = 0

while position < 10 {
    dice = Int.random(in: 1...6)
    if dice % 2 == 0 {
        position += 2
    } else if position > 0 {
        position -= 1
    }
    
    print("dice", dice, "   position", position)
}
```

# 1-22. ControlFlow - switch

---

### case let

값을 직접 갖고 오는데, 변수명을 내가 지정해서 갖고와, 작업을 하고 싶은 경우

```swift
// switch case let
let media = ("abc음악", 180) // 튜플

switch media {
	case let (title, length):
	    print("제목", title)
	    print("길이", length)
}
```

```swift
import Foundation

// ControlFlow (흐름 제어) - switch

var number = 3

switch number {
case 3 :
    print("삼")
case 10 :
    print("십")
case 5 :
    print("오")
default:
    print("기타 숫자")
}

var string = "e"
switch string {
case "a":
    print("에이")
case "c"..."f":
    print("씨-에프")
default:
    print("기타 문자")
}

// switch case let
let media = ("abc음악", 180) // 튜플

switch media {
	case let (title, _):
	    print("제목", title)
}
```

# 1-23. Function_1

---

### Function (함수)

```swift
// Function (함수)
// 화면에 00점이라고 표현되게 만들겠다.
// description : string으로 만들어줌

func presentMyScore(socre: Int) {
    print(socre.description + "점")
}
presentMyScore(socre: 50)

func presentScore(myScore: Int, yourScore: Int) {
    print(myScore.description + "vs" + yourScore.description)
}
presentScore(myScore: 80, yourScore : 100)
```

## function return

```swift
func plus(num1 : Int, num2: Int) -> Int {
    return num1+num2
}
let sumResult = plus(num1: 50, num2: 30)
```

### 파라미터가 없는 경우

```swift
func pringHello() -> String {
    return "Hello"
}
pringHello() + "안녕"
```

### multiple return values

```swift
func scoreList() -> [Int] {
    return [50, 30, 60]
}
scoreList()

func scoreList2() -> (eng: Int, music: Int) {
    return (50, 80)
}
scoreList2().eng
```

### argument Labels, parameter name

```swift
// 함수 구현은 parameter name으로 외부에서는 argument labels
func sumNumber1(num num1: Int, num num2:Int) {
    num1 + num2
}
sumNumber1(num: 80, num: 80)

// 매개 변수 이름을 생략할 수 있다.
// 매개변수를 충분히 추측할 수 있는 경우에 많이 사용
func sumNumber2(_ num1: Int, _ num2:Int) {
    num1 + num2
}
sumNumber2(30, 30)
```

### inout parameter

```swift
// 변수에 직접적으로 적용

var myScore = 60

func plusFive() {
    myScore += 5
}

func plusNewFive(score: inout Int) {
    score += 5
}

plusNewFive(score: &myScore)
```

# 1-24. Function_2

---

```swift
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
```

### 함수를 변수로 담기

선택만하고 싶은데, 계산과 진행까지 더 진행되어 버림, 더 복잡해져 보임
이름에 충실한 기능만 만들고 싶다면

```swift
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
```