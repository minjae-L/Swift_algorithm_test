import Foundation

let count = Int(readLine()!)!

// 2행 n열 스티커의 점수 입력받기
// dp의 인덱스 접근 편의상 맨 앞에 [0] 추가
// 해당 인덱스의 스티커를 붙이는 경우와 붙이지 않는경우 중 최댓값을 dp에 저장한다
for i in 0..<count {
    let size = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: size+1), count: 2)
    var arr: [[Int]] = [[0] + readLine()!.split(separator: " ").map{ Int($0)! }] + [[0] + readLine()!.split(separator: " ").map{ Int($0)! }]

    dp[0][1] = arr[0][1]
    dp[1][1] = arr[1][1]
    if size == 1 {
        print(max(dp[0][size], dp[1][size]))
    } else {
        for j in 2...size {
            dp[0][j] = max(dp[1][j-1] + arr[0][j], dp[0][j-1])
            dp[1][j] = max(dp[0][j-1] + arr[1][j], dp[1][j-1])
        }
        print(max( dp[0][size], dp[1][size]))
    }
    
    
}
