import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var arr = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 0..<n {
    var ip = Array(readLine()!).map{Int(String($0))!}
    arr.append(ip)
}
var answer = 0

// dp[n][m]: (n,m)점이 정사각형의 오른쪽하단일때, 만들어진 정사각형 변의길이
for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 1 {
            dp[i][j] = 1
            if i-1 >= 0 && j-1 >= 0 {
                var m = min(dp[i-1][j-1], dp[i][j-1])
                m = min(m, dp[i-1][j])
                dp[i][j] += m
            }
            
            answer = max(answer, dp[i][j])
        }
    }
}

print(answer * answer)
