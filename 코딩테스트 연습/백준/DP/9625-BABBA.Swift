import Foundation

let K = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 46), count: 2)

dp[0][1] = 1

for i in 2...45 {
    dp[0][i] = dp[0][i-1] + dp[1][i-1]
    dp[1][i] = dp[0][i-1]
}
print("\(dp[1][K]) \(dp[0][K])")
