import UIKit

// Tuple
var someTuple1 = (100, "kim", false)
var someTuple2 = (score: 100, userName:"kim", isShowName: false)
var someTuple3: (String, Int) = ("lee", 50)

// 조회
someTuple2.2
someTuple2.score

let (score, name, isShowName) = someTuple1
score
name
isShowName

// 업데이트
someTuple2.score = 50
someTuple2

// 삭제, 추가 기능은 없음
