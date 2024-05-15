import Foundation

//Array
let names = ["lee", "min", "kim", "su"]
// Dictonanry
let namesDic = ["lee" : "이", "min": "민", "kim":"김", "su": "수"]

//map
// element 변경가능, 개수를 변경 불가능
var newNames = [String]()
names.forEach{element in
    newNames.append(element+"님")
}

let newNames2 = names.map{ $0 + "님" }
let newName3 = names.map{$0.count}

let newNamesDic = namesDic.map { ele in
    ele.value
}
newNamesDic // dictionary는 순서의 개념이 없어 실행마다 순서는 다를 수 있다.

// filter
// 가져오고 싶은 데이터만 가져온다
names.filter { ele in
    if ele.count >= 3 {
        return true
    }
    return false
}

names.filter { ele in
    return ele.count >= 3
}

names.filter {
    $0.count >= 3
}

namesDic.filter { ele in
    ele.key.count >= 3
}

// map + filter
let newNames5 = names.filter{$0.count >= 3}
                        .map{ $0.count }


// reduce
// 이어 붙이기
names.reduce("") { partialResult, ele in
    partialResult + ele
}

let newNames6 = names.filter{$0.count >= 3}
                        .map{ $0.count }
                        .reduce(0){ $0 + $1 }

// compactMap
//nil 제거, optional 바인딩
var num = [1,2,3,nil,5,6,7,nil,8]
let compactNewNumber = num.compactMap{ $0 }

var stringNum = ["1", "2", "3", nil, "5"]
let compactValue = stringNum.compactMap{Int($0 ?? "")}


// flatMap
// 이차 배열 -> 일차 배열
// 한단계만 내려 준다. 
var doubleNumbers = [[1,2,3], [5, 6]]
let newdoubleNumbers = doubleNumbers.flatMap { ele in
    ele
}
newdoubleNumbers
