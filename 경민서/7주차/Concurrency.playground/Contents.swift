import Foundation
import UIKit

// iOS 15. Swift5.5
// concurrency programming, 동시성 프로그래밍 (iOS 13 직접 동시성 만들기 가능)
// async / await

// 동기 함수 -> 비동기 함수: async 사용
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
