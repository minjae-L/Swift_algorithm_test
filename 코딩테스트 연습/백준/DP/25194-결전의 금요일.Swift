import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.sort{$0 < $1}
var dp = Array(repeating: 0, count: 7)
dp[0] = 1

for i in 0..<arr.count {
    var nam = Array(repeating: 0, count: 7)
    for j in 0..<7 {
        if dp[j] == 1 {
            nam[(arr[i]+j) % 7] = 1
            nam[j] = 1
        }
    }
    dp = nam
}
if dp[4] == 1 {
    print("YES")
} else {
    print("NO")
}
