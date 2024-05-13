import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var arr = Array(repeating: Array(repeating: 0, count: 2), count: N+1)

// 주어진 행렬들의 행,열 저장
for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i+1][0] = input[0]
    arr[i+1][1] = input[1]
}

// dp[i][j]: i번째부터 j번째까지 연산의 최소횟수
// 가장 좁은구간부터 구한 값을 이용해 넓은 구간의 최솟값을 구한다.
for i in 1...N {
    for j in 1..<N-i+1 {
        dp[j][j+i] = Int.max
        for k in j..<j+i {
            dp[j][j+i] = min(dp[j][j+i], dp[j][k] + dp[k+1][j+i] + (arr[j][0] * arr[k][1] * arr[i+j][1]))
        }
    }
}
print(dp[1][N])

