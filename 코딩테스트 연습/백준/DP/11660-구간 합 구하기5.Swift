import Foundation

var counts = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [Array(repeating: 0, count: counts[0] + 1)]
var dp = Array(repeating: Array(repeating: 0, count: counts[0] + 1), count: counts[0] + 1)
// 주어진배열 저장
// (n+1) x (n+1) 크기로 저장하고, 행렬의 인덱스가 0이면 0 저장
for i in 0..<counts[0] {
    arr.append([0] + readLine()!.split(separator: " ").map{ Int($0)! })
}

// dp[i][j] = 0,0 부터 i,j까지 모두 합한 결과를 저장
for i in 1..<dp.count {
    for j in 1..<dp.count {
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + arr[i][j]
    }
}

// 해당 범위만큼의 연산결과 출력
for i in 0..<counts[1] {
    var inputs = readLine()!.split(separator: " ").map{ Int($0)! }
    let x1 = inputs[0]
    let y1 = inputs[1]
    let x2 = inputs[2]
    let y2 = inputs[3]

    print(dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1])
}
