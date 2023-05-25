import Foundation

// 배열 입력
let count = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.insert(0, at: 0)
var dp = Array(repeating: 0, count: count+1)
var max = Int.min

// dp 입력
// dp[n] = n번째 인덱스까지의 가장 긴 부분수열의 합
for i in 1...count {
    dp[i] = arr[i]
    for j in 1..<i {
        if arr[j] < arr[i] && dp[i] < dp[j] + arr[i] {
            dp[i] = dp[j] + arr[i]
        }
    }
}
print(dp)
print(dp.max()!)
