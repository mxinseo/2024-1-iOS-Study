import Foundation

// static
// 하나의 원본, 똑같은게 여러개 생기지 않는 옵션

// type property
// type method

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

Bank.coin
