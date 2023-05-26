import Foundation

// 배열 입력받기
let count = Int(readLine()!)!
var arr = [0] + readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: 1, count: count+1)
dp[0] = 0

// dp 입력
// i번째 원소보다 작은 j번째가 있는경우
// 해당하는 값이 이전에 나와있는지를 판단하기위해 dp[i] < dp[j] + 1 조건문을 걸었다.
for i in 1...count {
    for j in 1..<i {
        if arr[i] < arr[j] && dp[i] < dp[j] + 1 {
            dp[i] += 1
        }
    }
}
print(dp.max()!)

