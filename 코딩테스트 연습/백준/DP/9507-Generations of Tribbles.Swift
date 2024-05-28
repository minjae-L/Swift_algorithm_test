import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 68)
dp[0] = 1
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4...67 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3] + dp[i-4]
}
for i in 0..<T {
    print(dp[Int(readLine()!)!])
}
