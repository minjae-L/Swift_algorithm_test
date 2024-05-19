import Foundation

// 입력받기
let n = Int(readLine()!)!
// 타일의 크기가 피보나치수 처럼 증가
var dp = Array(repeating: 0, count: 81)
dp[1] = 1
dp[2] = 1

for i in 3...80 {
    dp[i] = dp[i-1] + dp[i-2]
}
// 둘레 출력
if n == 1 {
    print(4)
} else {
    print(dp[n] * 4 + dp[n-1] * 2)
}
