import Foundation

// 입력
var s1 = Array(readLine()!).map{ String($0) }
var s2 = Array(readLine()!).map{ String($0) }
var dp = Array(repeating: Array(repeating: 0, count: s1.count+1), count: s2.count+1)
s1.insert("0", at: 0)
s2.insert("0", at: 0)


// DP
// 같은 알파벳을 마주한경우, 이전까지 탐색했던 LCS의 최대길이 + 1을 해준다.
// 다른알파벳을 만났다면 이전에 검사했던 LCS중 가장 긴 길이를 가져온다.
for i in 1..<s2.count {
    for j in 1..<s1.count {
        if s2[i] == s1[j] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

// LCS의 수열 구하기.
// 위의 DP표를 구했던 방법의 역순으로 구하였다.
var idx = dp[s2.count-1][s1.count-1]
var x = s1.count - 1
var y = s2.count - 1
var result = ""
while idx != 0 {
    if dp[y][x] == dp[y-1][x] {
        y -= 1
        continue
    }
    if dp[y][x] == dp[y][x-1] {
        x -= 1
        continue
    }
    result = s1[x] + result
    x -= 1
    y -= 1
    idx -= 1
}
print(result.count)
print(result)

