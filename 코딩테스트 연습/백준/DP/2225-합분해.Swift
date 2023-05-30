import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)

// DP 입력
// dp[n][k] = dp[n][k] + dp[i][k-1] (i는 0부터 n까지의 정수)
for i in 1...input[1] {
    for j in 0...input[0] {
        if i == 1 || j == 0 {
            dp[j][i] = 1
            continue
        }
        for k in 0...j {
            dp[j][i] = (dp[j][i] + dp[k][i-1]) % 1000000000
        }
    }
}
print(dp[input[0]][input[1]])

