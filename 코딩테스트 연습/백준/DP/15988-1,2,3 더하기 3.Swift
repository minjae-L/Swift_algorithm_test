import Foundation

// 입력받기
let T = Int(readLine()!)!
// dp
var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4

// dp[i]: i를 1,2,3의 합으로 나타내는 최소횟수
// 점화식 dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
for i in 4...1000000 {
    dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % 1000000009
}

for i in 0..<T {
    print(dp[Int(readLine()!)!])
}
