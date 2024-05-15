# 섹션 1.31 - 섹션 1.38

기한: 05/09/2024
세미나: 6주차 세미나
주차: 5

## 수강 강의

- [x]  [31. init45 : 19](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133597)
- [x]  [32. deinit12 : 11](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133598)
- [x]  [33. static09 : 03](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133599)
- [x]  [34. property_130 : 09](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133600)
- [x]  [35. property_211 : 47](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133601)
- [x]  [36. property_316 : 02](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133602)
- [x]  [37. subscript21 : 52](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133603)
- [x]  [38. Error Handling 22 : 28](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133605)

# 1-31. init

---

### init은 여러개로 만들 수 있다. (customizing initialization)

```swift
import Foundation

// class and struct

// 1 oz = 29.5ml
// 1ml = 0.033oz

struct UnitConversion {
    var oz: Double
    var ml: Double
    
    init(oz: Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml: Double) {
        self.ml = ml
        self.oz = ml / 29.5
    }
}
```

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled.png)

### convenience initailizer

- 조건 → class에서만 가능.  내부에서 다른 init을 반드시 실행
- init 안에서 같은 로직이 있을 때 단순히 설계할 수 있다.

```swift
class Profile{
    var name : String
    var age: Int
    var isAdult: Bool
    
    //Designated initializer
    init(name: String, age:Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true: false
    }
    
//    init(age:Int) {
//        self.name = "" // 빈 스트링
//        self.age = age
//        self.isAdult = age > 19 ? true: false
//    }
    
    // 위와 같은 동작을 한다.
    convenience init(age: Int) {
        self.init(name: "", age: age)
    }   
}
```

### 상속

- Designated initializer을 상속할 때는 → super.init()을 호출해야 한다.

```swift
// 상속
class MemberProfile: Profile {
    override init(name: String, age: Int) {
        let newName = name + "님"
        super.init(name: newName, age: age)
    }
}
```

### Initializer Chaining - 상속 관계에서 init()의 관계

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%201.png)

### Required init

- 반드시 구현되어야 하는 init()
- 대부분은 개발자가 상속을 받으면서 사용하게 되는데, 상속하는 class의 init() 옵션을 잘 알고 처리해줘야 한다.

```swift
// Required init
// 상속
class BaseView {
    init(frame: CGRect) {
        
    }
    
    required init(coder: NSCoder) {
        
    }
}

class RedView: BaseView {
    init() {
        let frame = CGRect()
        super.init(frame: frame)
    }
    override init(frame: CGRect) {
        let frame = CGRect()
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
```

### Failable initializer

- 실패가 가능한 init()
- 조건을 실패하면 메모리 할당이 안되도록 할 수 있다.

```swift
// Failable initializer
//init?

class MyClass {
    init?(type: String) {
        if type == "" {
            return nil
        }
        print("success", type)
    }
}
```

# 1-32. deinit

---

```swift
// reference count == 0 인 시점에
// 메모리에서 해제

var test1 = Test()
var test2 = test1
var test3 = test1

test1 = Test() // 기존의 연결은 끊어지고 새로이 연결됨
test2 = Test()
test3 = Test() // 가장 처음의 test1이 연결 해제 됨
```

- nil이 되거나 원래 참조 하고 있던 변수에 새로 참조될 때

# 1-33. static

---

- 하나의 값으로 관리할 수 있다.
- type property & type method

```swift
class Bank {
    static var coin: Int = 0
}

Bank.coin
Bank.coin=100
Bank.coin

class Player {
    func plus() {
        Bank.coin += 1
    }
    
    func minus() {
        Bank.coin -= 1
    }
}

let player1 = Player()
let player2 = Player()
let player3 = Player()

player1.plus()
player2.plus()
player3.plus()
```

# 1-34. property_1

---

### stored property

- class나 struct에 포함되어 있는 stored property
- class는 reference 타입, struct는 value 타입
- class 내부에 정의되어 있는 property의 타입이 기준
- struct는 값을 가지고 있는 형태 이기 때문에, 선언할때의 타입이 기준

![let으로 선언된 구조체는 property를 수정할 수 없다](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%202.png)

let으로 선언된 구조체는 property를 수정할 수 없다

### lazy stored property

- 인스턴스가 생성이 될 때까지는 생성이 안된다.
- 접근하는 순간(사용하는 순간)에 생성이 된다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%203.png)

### computed property

- lazy를 이용한 logic에서는 메모리에 저장된 값을 기준으로 작동하기 때문에 함수화 해줘야 원하는 논리로 작동이 된다.
- 이 과정을 간소화 하기 위해 property를 함수화 할 수 있다. → 항상 새로운 값을 사용하게 됨

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%204.png)

- get, set을 사용할 수 있다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%205.png)

# 1-35. property_2

---

## property observer

- 단, reference type 인 class 안에서는 감지하지 못한다.

### willSet + newValue

- 값을 변경할 때 세팅 전의 값과 새로 설정되려는 값을 확인 할 수 있다.
- 값이 변경될 때 호출되는 코드

### didSet + oldValue

- 설정이 되었는데, 설정 이전의 값을 알고 싶을 때

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%206.png)

# 1-36. property_3

---

- 기능으로 작동하는 property
- 다른 class에도 동일하게 적용되는 logic 이라면 @**@propertyWrapper** 로 사용할 수 있다.

```swift
import Foundation

// property wrappers
// 프로퍼티에 기능을 넣는다

//글자 입력 제한 - 10
@propertyWrapper
struct CharLimit {
    var tempText = ""
    
    var wrappedValue: String {
        get {
            return tempText
        }
        set {
            var myText = newValue
            while myText.count > 5 {
                myText.removeLast()
            }
            tempText = myText
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

class Display {
    @CharLimit 
    var name: String = ""
    
    @CharLimit
    var password: String = ""
}

let display = Display()
display.name = "123234434"
display.password = "1231342412"

display.name
display.password

```

- 속성에 변수를 넣고 싶을 때
- 하나의 로직으로 여러번 응용이 가능하다

```swift
import Foundation

// property wrappers
// 프로퍼티에 기능을 넣는다

//글자 입력 제한 - 10
@propertyWrapper
struct CharLimit {
    var tempText = ""
    
    var limitCount = 0
    
    var wrappedValue: String {
        get {
            return tempText
        }
        set {
            var myText = newValue
            while myText.count > limitCount {
                myText.removeLast()
            }
            tempText = myText
        }
    }
    
    init(wrappedValue: String, limitCount: Int) {
        self.wrappedValue = wrappedValue
        self.limitCount = limitCount
    }
}

class Display {
    @CharLimit(limitCount: 10)
    var name: String = ""
    
    @CharLimit(limitCount: 5)
    var password: String = ""
}

let display = Display()
display.name = "1232344qwe34"
display.password = "1231342412"

display.name
display.password

```

# 1-37. subscript

---

- class에서 배열의 데이터에 index로 접근하는 것을 만들 때 사용된다.
- get과 set으로 세팅할 수 있다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%207.png)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%208.png)

# 1-38. error handling

---

- 분기 처리는 정상적인 로직을 처리해준다.
- 에러는 분기문으로 처리하면 좋은 로직이 아니다
1. 에러 타입을 정의, func에 에러 로직과 리턴에 에러가 나올 수 있음을 throws로 명시
2. 사용을 할 때는 do-catch 로 명시

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%209.png)

- 에러를 포함한 클로저를 사용할 때 → rethows로 정의해준다.
- completion에서 발생한 error를 받아서 다시 던져 준다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2031%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2038%20010fa8a056134b378f7545d8464fcbf7/Untitled%2010.png)