import Foundation

let count = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100001)
dp[0] = 1

// dp 입력
for i in 1...count {
    if i == 1 {
        dp[1] = 3
        continue
    }
    dp[i] = (2 * dp[i-1] + dp[i-2]) % 9901
}

print(dp[count])
