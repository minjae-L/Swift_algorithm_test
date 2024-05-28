import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let D = input[0], K = input[1]
var answer = ""
// dp[n] = dp[n-1] + dp[n-2]로 나타낼 수 있다.
// dp1: dp[1]의 갯수
// dp2: dp[2]의 갯수
var dp1 = Array(repeating: 0, count: D+1)
var dp2 = Array(repeating: 0, count: D+1)
dp1[1] = 1
dp1[2] = 0
dp2[1] = 0
dp2[2] = 1
for i in 3...D {
    dp1[i] = dp1[i-1] + dp1[i-2]
    dp2[i] = dp2[i-1] + dp2[i-2]
}
var idx = 1
while true {
    let num = K - idx * dp1[D]
    if num % dp2[D] == 0 {
        answer = "\(idx)\n\(num / dp2[D])"
        break
    }
    idx += 1
}
print(answer)
