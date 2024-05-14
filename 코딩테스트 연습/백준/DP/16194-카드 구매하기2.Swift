import Foundation

// 입력 받기
let N = Int(readLine()!)!
var P = readLine()!.split(separator: " ").map{Int(String($0))!}
P.insert(0, at: 0)
var dp = Array(repeating: 0, count: N+1)

// dp[i]: i개의 카드를 구매할때의 최소비용
for i in 1...N {
    dp[i] = 100000000
    for j in 0...i {
        dp[i] = min(dp[i], dp[j] + P[i-j])
    }
}
print(dp[N])
