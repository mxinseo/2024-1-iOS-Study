import Foundation

// property observer

class StepCounter {
    var steps = 0 {
        willSet {
            print("현재값", self.steps)
            print("설정하려는 값", newValue)
        }
        didSet {
            print("이전 값", oldValue)
            print("현재 값", steps)
        }
    }
}

let stepCounter = StepCounter()
stepCounter.steps = 10

