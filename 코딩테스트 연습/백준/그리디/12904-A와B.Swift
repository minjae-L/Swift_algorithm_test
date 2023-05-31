import Foundation

var s1 = Array(readLine()!).map{ String($0) }
var s2 = Array(readLine()!).map{ String($0) }

// S 와 T가 같아질때까지
// 맨 뒤 문자에 따라 연산을 달리한다.
while s2.count != s1.count {
    var lastStr = s2.removeLast()
    if lastStr == "B" {
        s2 = s2.reversed()
    }
}
if s1 == s2 {
    print(1)
} else {
    print(0)
}
