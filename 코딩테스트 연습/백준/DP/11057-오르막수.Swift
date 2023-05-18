import Foundation

let count = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: count+1)
var result = 0

// 1자리 수는 오르막수도 1개
for i in 0..<10 {
    dp[1][i] = 1
}

// i자리 수에서 앞자리가 j일때 dp[i][j] += dp[i-1][k] ( j<= k <= 9 )
if count == 1 {
    result = dp[1].reduce(0 ,+)
} else {
    for i in 2...count {
        for j in 0...9 {
            for k in j...9 {
                dp[i][j] = (dp[i][j] + dp[i-1][k]) % 10007
            }
        }
    }
    result = dp[count].reduce(0, +) % 10007
}

print(result)
