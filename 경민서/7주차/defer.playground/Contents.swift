import Foundation

//defer

func test(a: Int) {
    var aa = a
    
    // 이 로직은 무조건 마지막에 해야 함
    defer {
        aa = aa * 10
    }
    
    aa = aa + 10

}

test(a: 10)
