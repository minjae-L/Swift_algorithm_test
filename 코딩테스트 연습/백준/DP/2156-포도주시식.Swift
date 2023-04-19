import Foundation

let count = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: count+1)
var arr = [0]
dp[0] = 0
for i in 0..<count {
    arr.append(Int(String(readLine()!))!)
}

dp[1] = arr[1]
if count != 1 {
    dp[2] = arr[1] + arr[2]
    if count > 2 {
        for i in 3...count {
            dp[i] = max(dp[i-2] + arr[i], dp[i-3] + arr[i-1] + arr[i])
            dp[i] = max(dp[i-1], dp[i])
        }
    }
}
print(dp.max()!)

