import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

// 게임판 입력
for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
dp[0][0] = 1

// DP
// 이동한지점은 이전지점의 DP값을 더해가는 방식을 사용
for i in 0..<n {
    for j in 0..<n {
        if dp[i][j] != 0 && arr[i][j] != 0 {
            let m = arr[i][j]
            if i+m < n {
                dp[i+m][j] += dp[i][j]
            }
            if j+m < n {
                dp[i][j+m] += dp[i][j]
            }
        }
    }
}

print(dp[n-1][n-1])
