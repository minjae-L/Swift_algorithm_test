import Foundation

var str1 = readLine()!
var str2 = readLine()!
var strArr1 = ["0"] + str1.map{String($0)}
var strArr2 = ["0"] + str2.map{String($0)}
var dp = Array(repeating: Array(repeating: 0, count: str1.count+1), count: str2.count+1)


for i in 1...str2.count {
    for j in 1...str1.count {
        if strArr2[i] == strArr1[j] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[str2.count][str1.count])
