import Foundation

let count = Int(String(readLine()!))!
var dp = Array(repeating: Array(repeating: 0, count: 30), count: 30)
for i in 1..<30 {
    for j in 0...i {
        if j == 0 || i == j {
            dp[i][j] = 1
            continue
        }
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
    }
}

for i in 0..<count {
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    print(dp[arr[1]][arr[0]])
}

