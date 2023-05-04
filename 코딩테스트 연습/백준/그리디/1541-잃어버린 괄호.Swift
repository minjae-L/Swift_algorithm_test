import Foundation

var str = Array(readLine()!).map{String($0)}
var sum = 0
var isSub = false   //음수 판별
var numArr = [String]()

for i in str {
    if Int(i) != nil {  // + - 기호가 아니면 따로저장
        numArr.append(i)
    } else {
        if isSub {      // 숫자 이전에 음수가 나왔다면 저장된 배열의 숫자를 빼준다
            sum -= Int(numArr.joined(separator: ""))!
            numArr = []
        } else {        // 숫자 이전에 음수가 나오지 않았다면 저장된 배열의 숫자를 더해준다.
            sum += Int(numArr.joined(separator: ""))!
            numArr = []
        }
        
        if i == "-" {
            isSub = true
        }
    }
}

if isSub {      // 마지막 숫자를 더하거나 빼준다.
    sum -= Int(numArr.joined(separator: ""))!
} else {
    sum += Int(numArr.joined(separator: ""))!
}

print(sum)
