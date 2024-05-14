import Foundation

// 입력 받기
let n = Int(readLine()!)!
var dp = ([0], [1])

if n < 2 {
    if n == 0 { print(dp.0.map{String($0)}.joined())}
    if n == 1 { print(dp.1.map{String($0)}.joined())}
} else {
    var idx = 1
    while idx < n {
        idx += 1
        var tp = (dp.1 + [0], [Int]())
        var carry = 0
        var next = [Int]()
        zip(dp.0 + [0], tp.0).forEach {
            next.append(($0 + $1 + carry) % 10 )
            carry = ($0 + $1 + carry)/10
        }
        tp.1 = next
        if tp.1.last! == 0 {
            tp.1.removeLast()
            tp.0.removeLast()
        }
        dp = tp
        
    }
    print(dp.1.map{String($0)}.reversed().joined(separator: ""))
}
