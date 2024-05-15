# 섹션 1.39 - 섹션 1.45

기한: 05/16/2024
세미나: 7주차 세미나
주차: 6

- [x]  [39. protocol13 : 46](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133604)
- [x]  [40. protocol_220 : 12](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133607)
- [x]  [41. protocol_314 : 38](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133608)
- [x]  [42. Type Casting28 : 17](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133606)
- [x]  [43. Generic23 : 32](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133609)
- [x]  [44. DispatchQueue (async, sync, serial, concurrent)53 : 49](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133610)
- [x]  [45. higher order function (고차함수)35 : 59](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133611)

# 1-39. protocol_1

---

- 규격을 정할 수 있다.
- 다른 class 에서 사용할 수 있으며, 타입처럼 정의한다.
- protocol에서 정의한 모든 property는 구현되어야 한다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled.png)

# 1-40. protocol_2

---

- mutating

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%201.png)

- delegation
    - 연결하고 있기 때문에 weak 로 선언하는 것이 좋다
    - 그리고 weak로 선언하려면 프로토콜에 class에서만 사용한다는 AnyObject로 타입을 선언해주어야 한다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%202.png)

# 1-41. protocol_3

---

### protocol extension

- 상속과 유사하게 프로토콜에 기능을 추가할 수 있다.
- extension으로 선언하여 프로토콜에 추가 할 수 있는 기능을 정의해 놓는다.
- 프로토콜로 정의된 구조체는 해당 extension을 구현해도 되고 안해도 된다.
- 똑같은 코드를 사용한다면 extension으로 선언하여 필요한 곳에서 사용한다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%203.png)

### protocol composition

- 여러개의 프로토콜을 합쳐서 선언할 수 있다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%204.png)

# 1-42. type casting

---

### conversion

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%205.png)

### casting

- 클래스의 상속관계에서 주로 사용한다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%206.png)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%207.png)

- 타입 변환 확인하기

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%208.png)

# 1-43. Generic

---

- 로직은 같은데 그 안에 타입만 바뀌는 경우

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%209.png)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2010.png)

- stack + generic + protocol → **associatedtype 사용**
    - 프로토콜에서 제네릭을 채택해야 하는 경우 키워드로 사용한다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2011.png)

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2012.png)

# 1-44. DispatchQueue

---

- thread = 작업자
- main thread
    - main 작업자
    - serial로만 작업을 한다.
    - UI 처리를 하는 곳
        - 다른 스레드에서 UI 변경을 하고 싶으면 main.async로 넣어주면 된다.
    - 일반적으로 작성한 코드의 흐름이 작동됨
    - main) ——————————————————————————-
    - main sync)      ———-1———-
        - → crash 발생
    - main) ——————————————————————————-
    - global async)      ———-
    - main sync)          ———1———-
        - → crash 발생 안함!
    
- Serial = 하나의 작업이 완료된 후 다음 작업이 진행되는 형태
    - thread가 작업이 완료 될 때까지 thread내의 다른 작업을 못해서 멈추는 것처럼 보임
    - 작업자1)  —1—
    - 작업자1)          ——-2————-
    - 작업자1)                                    —————3—————
- concurrent = 하나의 작업자가 동시에 실행
    - 작업자1)  —1—
    - 작업자1) ——-2————-
    - 작업자1) —————3—————

```swift
@IBAction func start(_ sender: Any) {
        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish1")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish2")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish3")
        }
    }
```

- async  = 작업자 각자가 무관하게 진행
    - 다른 스레드를 멈추게 하지 않는다
    - 작업자1)  —1—
    - 작업자2) ——-2————-
    - 작업자3) —————3—————
    - 스레드가 안전하지 않음
        - 하나의 데이터 값에 async를 여러번 하면 crash가 나거나, 제대로 적용되지 않을 수 있다.
- sync  = 다른 작업자가 작업을 끝내기 전까지 기다리는 형태
    - 스레드가 실행된 베이스의 다른 스레드를 lock
    - 작업자1)  —1—
    - 작업자2)          ——-2————-
    - 작업자3)                                    —————3—————

```swift

    @IBAction func start(_ sender: Any) {
        // async 동시에 실행, 다른 스레드를 멈추게 하지 않는다
        // sync 작업이 끝날 때까지 다른 작업자가 기다린다.
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish1")
        }
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish2")
        }
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish3")
        }
    }
```

# 1-45. higher order function

---

- map

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2013.png)

- filter

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2014.png)

- map + filter

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2015.png)

- reduce

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2016.png)

- compactMap - nil을 걸러준다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2017.png)

- flat map

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2039%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2045%201a1719ed2011460abf500fa77bcd50a6/Untitled%2018.png)