import Foundation

var count = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: count)

for i in 0..<count {
    var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
    
    if i == 0 {
        dp[0] = arr[0]
        continue
    }
    for j in 0...i {
        if j == 0 {
            arr[0] = arr[0] + dp[0]
        } else if j == i {
            arr[j] = dp[i-1] + arr[j]
        } else {
            arr[j] = arr[j] + max(dp[j-1], dp[j])
        }
    }
    for k in 0..<arr.count {
        dp[k] = arr[k]
    }
    
}

print(dp.max()!)
