import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = [[0]]
let a1 = readLine()!.split(separator: " ").map{Int(String($0))!}
let a2 = readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = a2.reduce(0, +)
var answer = Int.max
for i in 0..<N {
    arr.append([a1[i],a2[i]])
}
// dp[i][j]: i번째 앱, j의 최소비용을 들였을때, 할당되는 메모리
var dp = Array(repeating: Array(repeating: 0, count: sum + 1), count: N+1)

// 배낭문제
for i in 1...N {
    for j in 0...sum {
        dp[i][j] = dp[i-1][j]
        if j - arr[i][1] >= 0 {
            dp[i][j] = max(dp[i][j], dp[i-1][j-arr[i][1]] + arr[i][0])
        }
        if dp[i][j] >= M {
            answer = min(answer, j)
        }
    }
}
print(answer)
