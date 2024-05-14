import Foundation

// 입력 받기
let T = Int(readLine()!)!

// dp[i][n]: 뒷자리가 n으로 끝나는 1,2,3의 더하기 횟수
var dp = Array(repeating: Array(repeating: 0, count: 4), count: 100001)
dp[1][1] = 1
dp[2][2] = 1
dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

// dp[i][1]: 양의정수 i가 1로 끝나는 경우의 수는 양의 정수 i-1이 2와 3으로 끝나는 경우의수 합과 같다.
// dp[i][2]: 양의정수 i가 2로 끝나는 경우의 수는 양의 정수 i-2이 1와 3으로 끝나는 경우의수 합과 같다.
// dp[i][3]: 양의정수 i가 3로 끝나는 경우의 수는 양의 정수 i-3이 1와 2으로 끝나는 경우의수 합과 같다.
for i in 4...100000 {
    dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % 1000000009
    dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % 1000000009
    dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % 1000000009
}
for i in 0..<T {
    let n = Int(readLine()!)!
    
    print((dp[n][1] + dp[n][2] + dp[n][3]) % 1000000009)
}
