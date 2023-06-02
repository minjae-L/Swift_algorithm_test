import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)
var arr = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)

// 사탕 미로 입력
for i in 0..<input[0] {
    var a = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<a.count {
        arr[i+1][j+1] = a[j]
    }
}

// dp 입력
dp[1][1] = arr[1][1]
for i in 1...input[0] {
    for j in 1...input[1] {
        dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + arr[i][j]
    }
}
print(dp[input[0]][input[1]])
