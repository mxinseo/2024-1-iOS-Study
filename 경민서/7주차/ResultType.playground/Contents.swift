import Foundation

// Result Type

enum MyError: Error {
    case invaildURL
    case timeout
}

var isSuccess = false

func requestNerwork() throws -> String {
    if isSuccess {
        return "successString"
    } else {
        throw MyError.invaildURL
    }
}

do {
    let result = try requestNerwork()
    // 성공 처리
} catch {
    print(error)
    // 에러 처리
}


// Result<> 사용
func requestNerwork2() -> Result<String, MyError> {
    if isSuccess {
        return .success("success")
    } else {
        return .failure(.invaildURL)
    }
}

let myResult = requestNerwork2()
switch myResult {
case let .success(str):
    print(str)
case let .failure(fail):
    print(fail)
}

if case let Result.success(_) = requestNerwork2() {
    // success 만 처리 할 때
}

enum MyResult<T, R> where R: Error { // R은 에러 타입인 경우에만 한정한다.
    case success(T)
    case failure(R)
}
