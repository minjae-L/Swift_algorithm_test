import Foundation

var time = Int(String(readLine()!))!
var arr = [300, 60, 10]     //A , B, C 버튼 저장
var result = Array(repeating: 0, count: 3)
for i in 0..<arr.count {    // 초단위가 큰 버튼을 가장 많이 눌러줘야 누르는 버튼횟수의 최솟값이 된다.
    if arr[i] <= time {
        var num = time / arr[i]
        result[i] = num
        time = time - (arr[i] * num)
    }
}
if time != 0 {
    print(-1)
} else {
    print(result.map{String($0)}.joined(separator: " "))
}

