import Foundation

var num = Int(String(readLine()!))!
var arr = Array(repeating: Int.max, count: num+1)

arr[num] = 0
for i in stride(from: num, to: 1, by: -1) {
    if i % 3 == 0 {
        arr[i / 3] = min(arr[i / 3], arr[i] + 1)
    }
    if i % 2 == 0 {
        arr[i / 2] = min(arr[i / 2], arr[i] + 1)
    }
    arr[i-1] = min(arr[i-1], arr[i] + 1)
}

print(arr[1])
