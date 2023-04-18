import Foundation

var count = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: count)
var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}

for i in 0..<count {
    if i == 0 {
        dp[i] = arr[0]
        continue
    }
    dp[i] = max(arr[i], dp[i-1] + arr[i])
}
print(dp.max()!)
