import Foundation

// 입력 받기
var N = Int(readLine()!)!
// dp: 연산 최소횟수를 저장, sdp: 연산 최소로 했을때 해당 숫자를 저장
var dp = Array(repeating: 0, count:N+1)
var sdp = Array(repeating: 0, count: N+1)
var answer = "\(N)"
dp[1] = 0
sdp[1] = 1
// 주어진 N이 1보다 크면 연산이 필요하므로 연산
if N > 1 {
    for i in 2...N {
        // 기본적으로 1을 뺄 수 있음.
        dp[i] = dp[i-1] + 1
        sdp[i] = i - 1
        // 2로 나누어떨어진다면, 최솟값 갱신
        if i % 2 == 0 {
            if dp[i/2] == 0 || dp[i] > dp[i/2]+1 {
                dp[i] = dp[i/2] + 1
                sdp[i] = i/2
            }
        }
        // 3로 나누어떨어진다면, 최솟값 갱신
        if i % 3 == 0 {
            if dp[i/3] == 0 || dp[i] > dp[i/3]+1 {
                dp[i] = dp[i/3] + 1
                sdp[i] = i/3
            }
        }
    }
}

// 최소로 연산되었던 숫자들을 불러오기
var next = N
for i in 0..<dp[N] {
    answer += " \(sdp[next])"
    next = sdp[next]
}
print(dp[N])
print(answer)
