# 섹션 1.46 - 섹션 1.52

기한: 05/23/2024
세미나: 8주차 세미나
주차: 7

- [x]  [46. concurrency(동시성 프로그래밍)_1 23 : 05](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133612)
- [ ]  [47. concurrency(동시성 프로그래밍)_2 22 : 26](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133613)
- [ ]  [48. concurrency(동시성 프로그래밍)_3 36 : 16](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133614)
- [ ]  [49. concurrency(동시성 프로그래밍)_4 18 : 07](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/133615)
- [ ]  [50. Result Type 13 : 23](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/134819)
- [ ]  [51. defer 08 : 18](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/135063)
- [ ]  [52. lazy 22 : 50](https://www.inflearn.com/course/%EC%84%B1%EA%B3%B5-ios-%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%B4%88-%EC%8B%A4%EB%AC%B4/unit/136782)

# 1-46. concurrency(동시성 프로그래밍)_1

---

- 이전의 동시성 프로그래밍은 dispatchqueue, completion handler로 가능했었음
    - 가독성 면에서 떨어졌었음
    - 중지, 종료되는 부분이 미흡했었다.
- iOS 15부터 async, await가 새로 생겨남
    - 순서대로 읽히는 코딩이 가능해짐
    - 동기로 처리되는 듯한 느낌으로 만들어줌
    - 성능적으로 발전된 형태: 컨택스트 스위칭이 줄어들고 코어에 맞게 스레드가 생성된다.

### 동기

- 작업이 끝날때까지 다른 모든 것은 기다린다.
- 오래 걸리는 작업을 동기로 처리하면 사용자에게 불편함을 준다. → 비동기로 처리해 줘야 한다.

```swift
func someWork() {
    // 5초 정도 소요
}

func simpleWork() {
    "ddd"+"aaa+"+"www"
}

// 동기 sync
simpleWork()
someWork()
```

### 비동기 async + await

- async 비동기 함수로 작동한다고 알려주고, 중단 될 수 있음.
- await 비동기 함수의 중단되는 위치를 표시
- await 이하의 로직들은 await가 끝날때 까지 기다린다.
- Task : 동기 함수 안에서 비동기 함수를 호출할 수 있도록 해주는 규격
    - 비동기 함수안에서 비동기 함수를 호출하는 것에는 Task 로 감쌀 필요가 없다.

```swift
func someWork() async -> Int {
    // 5초 정도 소요
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5)
    return 5
}

func simpleWork() {
    print("ddd" + "aaa" + "www")
}

func start() {
    Task {
        print("start")
        let returnNum = await someWork()
        print(returnNum)
        print("finish")
        // xxx logic xxx
        // xxx logic xxx
        // xxx logic xxx
    }
    simpleWork()
}

start()
```

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2046%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2052%202bea3bd30ffb45bbbfd800151538e060/07ba1729-891f-4c71-b6f9-e27eb2926fd7.png)

→ 5초 뒤→

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2046%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2052%202bea3bd30ffb45bbbfd800151538e060/Untitled.png)

# 1-47. concurrency(동시성 프로그래밍)_2

---

- async를 병렬적으로 실행해보자
- await가 async 작업들이 모두 끝나기를 기다리고 있다가 이하의 작업들을 모두 실행시킨다.

```swift
Task {
    async let sec3 = asyncWork1(sec:3)
    async let sec1 = asyncWork1(sec:1)
    async let sec2 = asyncWork1(sec:2)
    
    let secArr = await [sec3, sec2, sec1] // 모두 결과가 나올 때까지 기다린다.
    print(secArr)
}
```

- async가 걸려 있는 작업들을 await로 실행하지 않는다면 다른 작업들이 Cancellation이 발생할 수 있다.
- tuple, arr로 묶기,  await 키워드를 모두 붙이는 방식을 사용해야 한다.

# 1-48. concurrency(동시성 프로그래밍)_3

---

- Task class 정의

```swift
// 에러가 없는 경우 Task 정의 <Success, Failure>
var myTask: Task<String,Never>?
```

- failure Error 정의

```swift
enum MyError: Error {
    case myType1
    case myType2
}

var myTask: Task<Void,Error>?
```

- isCancelled로 cancel 여부를 파악할 수 있다.

```swift
    Task {
        async let sec3 = asyncWork1(sec:3)
        async let sec1 = asyncWork1(sec:1)
        async let sec2 = asyncWork1(sec:2)
        
        // 더하기 작업을 cancel 되면 실행 안되게 만들자
        if myTask?.isCancelled == true {
            return "" // 실행 종료 + 이하의 코드 실행 안됨
        }
        
        // 또는
        guard myTask?.isCancelled == false else {
            return
        }
        
        let sum = await sec1 + sec2 + sec3
        print(sum)
        print("finish")
        
        return "aaa"
        
    }

    pressBtn()
```

- result로 success, failure 확인할 수 있다.

```swift
Task {
        print(await myTask?.result)
        do {
            let taskVal = try await myTask?.result.get() // success, failure 확인
            print("taskVal", taskVal)
        } catch {
            print(error)
        }
    }
```

- 커스텀 에러로 정의하자

```swift
func main() {
    myTask = Task {
        async let sec3 = asyncWork1(sec:3)
        async let sec1 = asyncWork1(sec:1)
        async let sec2 = asyncWork1(sec:2)
        
        var sum:UInt64 = 0
        do {
            sum = try await sec1 + sec2 + sec3
        } catch {
            **throw MyError.myType1**
        }
        
        // 더하기 작업을 cancel 되면 실행 안되게 만들자
        guard myTask?.isCancelled == false else {
            return 0
        }
        
        print(sum)
        print("finish")
        return sum
    }
    
    Task {
        print(await myTask?.result)
        do {
            let taskVal = try await myTask?.result.get() // success, failure 확인
            print("taskVal", taskVal)
        } **catch MyError.myType1{
            print("myType1 에러")
        } catch MyError.myType2{
            print("myType2 에러")
        }**
    }
}
```

# 1-49. concurrency(동시성 프로그래밍)_4

---

- Actor
    - 스레드 환경에서 안전하게 작동하도록 해줌
    - class와 유사한 형태로 만들 수 있다.
    - 상속 안됨
    - extension은 가능하다.
- dara race = thread unsafe한 상태
    - 충돌이 일어나는 상태
    - class로 정의하면 메모리 할당이 잘 안되고 손상된 상태

```swift
actor UserInfo {
    var names = [String]()
    
    func appendName() {
        names.append("kim")
        print("append done")
    }
}
```

- actor 외부(actor-isolated)에서는 **await을 붙이고 Task 클로저 안으로 넣어야 한다.**

```swift
class ViewController: UIViewController {
    
    var userInfo = UserInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...2 {
            addName()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Task {
                print("names", await self.userInfo.names)
                print("names count", await self.userInfo.names.count)
            }
        }
    }
    
    func addName() {
        DispatchQueue.global().async {
            Task {
                await self.userInfo.appendName()
            }
        }
    }
}
```

- nonisolated을 사용하면 actor와 상관 없이 일반적인 class 처럼 사용할 수 있다.

```swift
actor UserInfo {
    nonisolated let myname = "lee"
}
```

# 1-50. Result Type

---

- do-catch에서 성공과 에러 처리를 하기가 깔끔하지 않다
- 제네릭 타입으로 정의하고 에러의 경우도 return을 사용한다.
- 여러가지 형태

```swift
func requestNerwork2() -> Result<String, MyError> {
    if isSuccess {
        return .success("success")
    } else {
        return .failure(.invaildURL)
    }
}
```

```swift
let myResult = requestNerwork2()

switch myResult {
case let .success(str):
    print(str)
case let .failure(fail):
    print(fail)
}
```

```swift
enum MyResult<T, R> where R: Error { // R은 에러 타입인 경우에만 한정한다. 
    case success(T)
    case failure(R)
}
```

# 1-51. defer

---

- 가장 마지막에 실행되는 클로저 코드블록
- defer가 실행되지 않는 경우
    - defer 문 전에 retern 되면 defer가 실행되지 않는다.
    - 이전의 실행에서 에러가 발생해도 defer가 실행되지 않는다.
- defer가 여러개 있을 경우에는 정의된 역순으로 실행된다.
    - 하지만 defer를 여러개로는 잘 사용하지 않는다.

```swift
func test(a: Int) {
    var aa = a
    
    // 이 로직은 무조건 마지막에 해야 함
    defer {
        aa = aa * 10
    }
    
    aa = aa + 10

}
```

# 1-52. lazy

---

- class가 instantiaion이 되기 전에 class 내부에서 사용하고 싶은 경우
- lazy 키워드를 사용하여 접근할때 실행도록 한다.
- instantiaion 되어도 실행이 안된 것이고, 접근될 때 실행된다.

```swift
class AClass {
    var name = ""
    var age = 0
    
    **lazy** var isAdult: Bool = age > 10 ? true : false
}
```

- **주의 : lazy는 한번 접근되면 이후에 재연산하지 않는다.**
    - age를 20으로 대입하고 isAdult를 실행해도 false값이 나온다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2046%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2052%202bea3bd30ffb45bbbfd800151538e060/Untitled%201.png)

- filter와 map에도 lazy를 적용하면 제한된 범위만 적용할 수 있다.

![Untitled](%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2046%20-%20%E1%84%89%E1%85%A6%E1%86%A8%E1%84%89%E1%85%A7%E1%86%AB%201%2052%202bea3bd30ffb45bbbfd800151538e060/Untitled%202.png)

- lazy는 thread safe하지 않다.
    - 멀티 스레드에서 여러 곳에서 스레드가 접근하면 여러개가 생성되어 오류가 발생할 수 있다.
    - 클래스가 네트워크와 관련되어 있다면 사용 안하는 것이 좋다.