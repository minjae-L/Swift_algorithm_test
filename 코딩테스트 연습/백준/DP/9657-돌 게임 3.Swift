import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 0
dp[3] = 1
dp[4] = 1

// dp[n]: n개의 돌이 주어질 때, n번째 돌을 가져가는 사람 (1: 상근, 0: 창영)
for i in 5...1000 {
    if dp[i-1] == 0 {
        dp[i] = 1
    }
    if dp[i-3] == 0 {
        dp[i] = 1
    }
    if dp[i-4] == 0 {
        dp[i] = 1
    }
}

if dp[N] == 1 {
    print("SK")
} else {
    print("CY")
}
