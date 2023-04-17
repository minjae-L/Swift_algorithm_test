import Foundation

var count = Int(String(readLine()!))!

for i in 0..<count {
    var num = Int(String(readLine()!))!
    var arr = Array(repeating: 0, count: num+1)
    
    if num == 0 {
        arr[0] = 1
        print("1 0")
        continue
    } else if num == 1 {
        arr[1] = 1
        print("\(arr[0]) \(arr[1])")
        continue
    }
    arr[num] = 1
    for i in stride(from: num, to: 1, by: -1) {
        arr[i-1] += arr[i] * 1
        arr[i-2] += arr[i] * 1
    }
    print("\(arr[0]) \(arr[1])")
}
