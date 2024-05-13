import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

dp[1] = 1

for i in 1...N {
    if dp[i-1] == 1 {
        dp[i] = 0
    } else {
        dp[i] = 1
    }
    if i-3 >= 0 {
        if dp[i-3] == 0 {
            dp[i] = 1
        } else {
            dp[i] = 0
        }
    }
}

if dp[N] == 0 {
    print("SK")
} else {
    print("CY")
}
