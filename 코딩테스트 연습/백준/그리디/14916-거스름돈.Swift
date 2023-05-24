import Foundation

var money = Int(readLine()!)!
var result = 0
var max = money / 5
var isDone = false

// 5원으로 최대한 걸러줬을때, 2원으로 거를 수 있다면 동전갯수 출력
// 거스르지 못하면 5원의 갯수 1씩차감
// 5원의 갯수가 0개인데 2원으로 거스르지 못하면 -1 출력
while max >= 0 {
    var m = money - (max * 5)
    if m % 2 == 0 {
        result = max + (m / 2)
        isDone = true
        break
    } else {
        max -= 1
    }
}

if isDone {
    print(result)
} else {
    print(-1)
}
