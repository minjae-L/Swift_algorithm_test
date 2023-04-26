import Foundation

let count = Int(String(readLine()!))!

var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
for i in 3..<dp.count{
    dp[i] = (dp[i-1] + dp[i-2]) % 15746
}

print(dp[count])
