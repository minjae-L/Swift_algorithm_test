import Foundation

// 입력받기
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.insert(0, at: 0)
// dp[n]: n번째 상자를 넣어볼때의 최댓값
// dp[n]이 항상 최대값이 될 수 없다.(이전의 상자들이 이미 많이 들어간 경우가 존재할 수 있어서)
var dp = Array(repeating: 1, count: n+1)

// 현재 상자와 이전의 상자크기를 비교해서 넣을 수 있고 그게 최대의 경우라면 값 갱신
for i in 1...n {
    for j in 1..<i {
        if arr[j] < arr[i] && dp[i] < dp[j] + 1 {
            dp[i] = dp[j] + 1
        }
    }
}
print(dp.max()!)




