import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2]
var dp = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var middle = (x: 0, y: 0)
var idx = 1
dp[1][1] = 1
for i in 0..<N {
    for j in 0..<M {
        if idx == K {
            middle = (x: j, y: i)
        }
        idx += 1
    }
}
// dp[n][m]: n행m열에 도달하는 경우의 수
if K == 0 {
    for i in 1...N {
        for j in 1...M {
            if i == 1 && j == 1 { continue }
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
} else {
    for i in 1...middle.y+1 {
        for j in 1...middle.x+1 {
            if i == 1 && j == 1 { continue }
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
    for i in middle.y+1...N {
        for j in middle.x+1...M {
            if i == middle.y+1 && j == middle.x+1 { continue }
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
}
print(dp[N][M])
