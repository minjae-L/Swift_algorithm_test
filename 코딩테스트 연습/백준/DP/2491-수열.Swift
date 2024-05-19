import Foundation

//입력받기
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: Array(repeating: 1, count: n+1), count: 2)
var answer = 1
arr.insert(0, at: 0)
dp[0][1] = 1
dp[1][1] = 1

// dp[0][n]: n번째 수를 갖는 오름차순 수열의 최장길이
// dp[1][n]: n번째 수를 갖는 내림차순 수열의 최장길이
for i in 1...n {
    if i == 1 { continue }
    if arr[i] >= arr[i-1] { dp[0][i] = dp[0][i-1] + 1}
    if arr[i] <= arr[i-1] { dp[1][i] = dp[1][i-1] + 1}
    let mx = max(dp[0][i], dp[1][i])
    answer = max(mx,answer)
}
print(answer)
