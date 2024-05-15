import Foundation

// error handling

// 에러 케이스 정의
enum MyError: Error {
    case invalidValue
    case outOfLimit
}

var number = 0

func squareArea(width: Int, height: Int) throws -> Int {
    if width < 0 || height < 0 {
        throw MyError.invalidValue
    }
    if width >  100 || height > 100 {
        throw MyError.outOfLimit
    }
    
    return width * height
}

func area(completion: (Int, Int) throws -> Int) rethrows -> Int {
    try completion(40, 50)
}

do {
    try area(completion: squareArea)
} catch {
    print(error)
}

