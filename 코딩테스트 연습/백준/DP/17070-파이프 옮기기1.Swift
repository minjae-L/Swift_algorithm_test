import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()
var dp = [[[Int]]]()

for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 3차원 dp 선언
// 가로: 0, 세로: 1, 대각선: 2
for i in 0..<3 {
    var a = [[Int]]()
    dp.append(Array(repeating: Array(repeating: 0, count: n), count: n))
}

// 처음 파이프는 (0,0) 에서 (0,1)로 놓여져있다.
dp[0][0][1] = 1

// 파이프를 놓을 수 있는 조건에 맞게 dp값 입력
for i in 0..<n {
    for j in 0..<n {
        if i == 0 && j == 0 { continue }

        if j+1 < n && arr[i][j+1] == 0 {
            dp[0][i][j+1] += dp[0][i][j]
            dp[0][i][j+1] += dp[2][i][j]
        }
        if i+1 < n && arr[i+1][j] == 0 {
            dp[1][i+1][j] += dp[1][i][j]
            dp[1][i+1][j] += dp[2][i][j]
        }
        if i+1 < n && j+1 < n && arr[i+1][j] == 0 && arr[i][j+1] == 0 && arr[i+1][j+1] == 0 {
            dp[2][i+1][j+1] += dp[0][i][j]
            dp[2][i+1][j+1] += dp[1][i][j]
            dp[2][i+1][j+1] += dp[2][i][j]
        }
    }
}

print(dp[0][n-1][n-1] + dp[1][n-1][n-1] + dp[2][n-1][n-1])
