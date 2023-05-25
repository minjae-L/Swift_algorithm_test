import Foundation
// dp생성
var inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: Array(repeating: 0, count: inputs[0]+1), count: inputs[0]+1)

// k = 0 , k = n 인경우 1 저장
// k는 n보다 클 수 없다.
// 나머지 경우 점화식에따라 입력
for i in 0..<dp.count {
    for j in 0..<dp.count {
        if j > i {
            continue
        }
        if j == 0 || i == j {
            dp[i][j] = 1
        } else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j]) % 10007
        }
    }
}
print(dp[inputs[0]][inputs[1]])
