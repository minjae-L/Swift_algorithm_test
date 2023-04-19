import Foundation

let count = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: count+1)
dp[1] = 1

if count == 1 {
    print(dp[1])
} else {
    dp[2] = 3
    if count == 2 {
        print(dp[2])
    } else {
        for i in 3...count {
            dp[i] = (dp[i-1] + (2 * dp[i-2])) % 10007
        }
        print(dp[count])
    }
}
