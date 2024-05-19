import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = arr.removeLast()
var answer = 0
arr.insert(0, at: 0)
var dp = Array(repeating: Array(repeating: 0, count: 21), count: N)
dp[1][arr[1]] = 1

//dp[n][k]: n번째 수까지 연산했을때 k가 되는 경우의 수
for i in 2...N-1 {
    let num = arr[i]
    for j in 0...20 {
        if j - num >= 0 {
            dp[i][j] += dp[i-1][j-num]
        }
        if j + num <= 20 {
            dp[i][j] += dp[i-1][j+num]
        }
    }
}

print(dp[N-1][result])
