import Foundation

// 입력 받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: -1, count: N+1)
arr.insert(0, at: 0)
dp[1] = 0

// DP[i]: i위치까지의 최소점프횟수
for i in 1...N {
    // 해당위치에 도달하지 못한다면 패스
    if dp[i] == -1 { continue }
    for j in 0...arr[i] {
        if i+j <= N {
            if dp[i+j] == -1 {
                dp[i+j] = dp[i] + 1
            } else {
                dp[i+j] = min(dp[i+j], dp[i]+1)
            }
        }
    }
}
print(dp[N])
