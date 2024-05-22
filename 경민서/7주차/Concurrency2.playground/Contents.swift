import Foundation
import UIKit

// async func in parallel

// async let

func asyncWork1(sec: UInt64) async -> UInt64 {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    print(sec)
    return sec
}

Task {
    async let sec3 = asyncWork1(sec:3)
    async let sec1 = asyncWork1(sec:1)
    async let sec2 = asyncWork1(sec:2)
    
    let secArr = await [sec3, sec2, sec1] // 모두 결과가 나올 때까지 기다린다.
    print(secArr)
}
