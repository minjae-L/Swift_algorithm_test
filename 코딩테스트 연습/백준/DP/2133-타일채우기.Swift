import Foundation

var num = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)
// dp의 초기값 설정
// n이 홀수일때 주어진 타일로 채울 수 없다.
dp[0] = 0
dp[1] = 0
dp[2] = 3

// dp[n] = dp[n-2] * 3 + dp[n-4] * 2 + dp[n-6] * 2 + .... + dp[0] * 2 + 2
for i in stride(from: 4, through: 30, by: +2) {
    var sum = 0
    for j in stride(from: 0, through: i-4, by: +2) {
        sum += dp[j] * 2
    }
    dp[i] = dp[i-2] * 3 + 2 + sum
}

print(dp[num])
