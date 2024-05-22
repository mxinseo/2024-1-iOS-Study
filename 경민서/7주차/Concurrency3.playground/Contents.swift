import Foundation
import UIKit

// async func in parallel

// async let

func asyncWork1(sec: UInt64) async throws -> UInt64 {
    do {
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    } catch {
        print(error)
        throw error
    }
    print(sec)
    return sec
}

func pressBtn() {
    myTask?.cancel()
}

enum MyError: Error {
    case myType1
    case myType2
}

// Task 정의 <Success, Failure>
var myTask: Task<UInt64, Error>?

func main() {
    myTask = Task {
        async let sec3 = asyncWork1(sec:3)
        async let sec1 = asyncWork1(sec:1)
        async let sec2 = asyncWork1(sec:2)
        
        var sum:UInt64 = 0
        do {
            sum = try await sec1 + sec2 + sec3
        } catch {
            throw MyError.myType1
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
        } catch MyError.myType1{
            print("myType1 에러")
        } catch MyError.myType2{
            print("myType2 에러")
        }
    }
}

main()

