import Foundation

// 입력 받기
var N = Int(readLine()!)!
var dp = Array(repeating: 5, count: 500001)
var n = 1

// 제곱수는 자기 자신만 가지므로 모두 1
while n * n <= 50000 {
    dp[n*n] = 1
    n += 1
}

// dp[N]: N이 되는 제곱수의 최소갯수 합
for i in 1...N {
    let num = i
    // 제곱근을 구해 1부터 제곱근까지의 범위동안 제곱수 합의 최소갯수를 갱신
    for j in 1...Int(sqrt(Double(num))) {
        if dp[i-(j*j)] + 1 <= 4 {
            dp[i] = min(dp[i],dp[i-(j*j)]+1)
        }
    }
}
print(dp[N])

