import Foundation

// property wrappers
// 프로퍼티에 기능을 넣는다

//글자 입력 제한 - 10
@propertyWrapper
struct CharLimit {
    var tempText = ""
    
    var limitCount = 0
    
    var wrappedValue: String {
        get {
            return tempText
        }
        set {
            var myText = newValue
            while myText.count > limitCount {
                myText.removeLast()
            }
            tempText = myText
        }
    }
    
    init(wrappedValue: String, limitCount: Int) {
        self.wrappedValue = wrappedValue
        self.limitCount = limitCount
    }
}

class Display {
    @CharLimit(limitCount: 10)
    var name: String = ""
    
    @CharLimit(limitCount: 5)
    var password: String = ""
}

let display = Display()
display.name = "1232344qwe34"
display.password = "1231342412"

display.name
display.password
