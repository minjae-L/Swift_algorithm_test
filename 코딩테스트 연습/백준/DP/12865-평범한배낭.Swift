import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)
var weight = Array(repeating: 0, count: input[0] + 1)
var value = Array(repeating: 0, count: input[0] + 1)

for i in 1...input[0] {
    let item = readLine()!.split(separator: " ").map{ Int(String($0))! }
    weight[i] = item[0]
    value[i] = item[1]
}

for i in 1...input[0] {
    for j in 1...input[1] {
        if weight[i] <= j {
            dp[i][j] = max(dp[i-1][j-weight[i]] + value[i], dp[i-1][j])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[input[0]][input[1]])
