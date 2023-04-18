import Foundation

var count = Int(String(readLine()!))!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: count+1)

for i in 1...count {
    var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}

    if i == 1 {
        dp[1] = [arr[0], arr[1], arr[2]]
        continue
    }
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + arr[0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + arr[1]
    dp[i][2] = min(dp[i-1][1], dp[i-1][0]) + arr[2]
}

print(dp[count].min()!)
