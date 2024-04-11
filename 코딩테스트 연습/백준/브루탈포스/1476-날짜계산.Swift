import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [1,1,1]
var result = 1

while !(arr == input) {
    arr = arr.map{$0 + 1}
    result += 1
    if arr[0] > 15 {
        arr[0] = 1
    }
    if arr[1] > 28 {
        arr[1] = 1
    }
    if arr[2] > 19 {
        arr[2] = 1
    }
}

print(result)
