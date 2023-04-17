import Foundation

var count = Int(String(readLine()!))!
var arr = Array(repeating: 0, count: 12)
arr[1] = 1
arr[2] = 2
arr[3] = 4
for i in 4...11 {
    arr[i] = arr[i-1] + arr[i-2] + arr[i-3]
}

for i in 0..<count {
    var num = Int(String(readLine()!))!
    print(arr[num])
}

