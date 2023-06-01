import Foundation

var num = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 2
dp[3] = 1

// dp
for i in 1...1000 {
    if i % 3 == 0 {
        dp[i] = i / 3
    } else {
        dp[i] = dp[i/3] + dp[i%3]
    }
}

if dp[num] % 2 != 0 {
    print("SK")
} else {
    print("CY")
}
