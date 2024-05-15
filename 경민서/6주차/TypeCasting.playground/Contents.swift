import Foundation

// Type Casting
// Type Conversion

// conversion

var doubleNum : Double = 5.5

// Double -> Int
Int(doubleNum)


// casting
class MainClass {
    
}

class Sub1Class: MainClass {
    var imSub = ""
}

var sub1 = Sub1Class()
sub1.imSub = "im sub"

// Sub1Class -> MainClass / up casting : 무조건 가능
var newMain = sub1 as MainClass

// MainClass -> Sub1Class / down casting : 불가능한 경우가 있다
var newSub = newMain as! Sub1Class
newSub.imSub

// 되면 캐스팅을 하고 아니면 nil을 반환한다.
newMain as? Sub1Class


class Media {
    var name = ""
}
class Picture:Media {
    var size = ""
}
class Movie:Media {
    var length = 0
}

var medialist = [Media]()
let pic1 = Picture()
pic1.size = "400 x 300"
pic1.name = "p1"

let pic2 = Picture()
pic2.size = "80 x 30"
pic2.name = "p2"

let movie1 = Movie()
movie1.length = 100
movie1.name = "m1"

// 모두 규격이 업캐스팅되어 Media이므로 가능한 코드 이다.
medialist.append(pic1)
medialist.append(pic2)
medialist.append(movie1)


// 타입을 변환할 수 있는지 확인하는 코드
if let pic = medialist[0] as? Picture {
    print(pic.size)
} else if let movie = medialist[2] as? Movie {
    print(movie.length)
}

// 타입을 알아볼 수 있는 코드
medialist[0] is Movie

for media in medialist {
    if let pic = media as? Picture {
        print(pic.size)
    } else if let movie = media as? Movie {
        print(movie.length)
    }
}
