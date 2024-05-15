import Foundation

// Deinitializer 초기화 해제

class Test {
    init() {
        print("init")
    }
    
    deinit{
        // 클래스가 메모리에서 해제 되었을 때
        print("deinit")
    }
}

// reference count == 0 인 시점에
// 메모리에서 해제

var test1: Test? = Test()
var test2: Test? = test1
var test3: Test? = test1

test1 = nil
test2 = nil
test3 = nil

class Bank {
    static var coin: Int = 500
}

class Player {
    var coin:Int
    init(coin: Int) {
        self.coin = coin
    }
    
    func plus() {
        self.coin += 100
    }
    
    deinit {
        Bank.coin += self.coin
    }
}

var player1: Player? = Player(coin: 100)
var player2: Player? = Player(coin: 100)

player1?.plus()
player1?.plus()

player2?.plus()

Bank.coin

player1 = nil
player2 = nil

Bank.coin
