import Foundation

let num = Int(String(readLine()!))!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: num+1)

for i in 1...9 {
    dp[1][i] = 1
}

if num == 1 {
    print(dp[num].reduce(0, +))
} else {
    for i in 2...num {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i-1][1] % 1000000000
            } else if j == 9 {
                dp[i][j] = dp[i-1][8] % 1000000000
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
            }
        }
    }
    
    print(dp[num].reduce(0, +) % 1000000000)
}
