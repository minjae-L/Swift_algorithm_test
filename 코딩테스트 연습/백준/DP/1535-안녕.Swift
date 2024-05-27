import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 101), count: N+1)
var people = Array(repeating: Array(repeating: 0, count: 2), count: N+1)
let arr1 = readLine()!.split(separator: " ").map{Int(String($0))!}
let arr2 = readLine()!.split(separator: " ").map{Int(String($0))!}

// people[n][0]: 필요 체력
// people[n][1]: 얻는 행복
for i in 1...N {
    people[i][0] = arr1[i-1]
    people[i][1] = arr2[i-1]
}

// 배낭문제
// 해당인원과 인사를 하는경우와 하지않는경우
// dp[n][100]: n번째 인원까지의 행복 최댓값
for i in 1...N {
    for j in 1...100 {
        if j - people[i][0] > 0 {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-people[i][0]] + people[i][1])
        }else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[N][100])
