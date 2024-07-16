import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = [[0]]
let INF = 100000000
var ans = INF
for _ in 1...N {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 첫번째 집이 어떤색을 칠하는지? 가 기준이 된다.
// 집이 나열된 선분을 순환구조로 나타낸다면, 인접한 집과의 색은 같으면 안된다.
// 첫번째 집을 세가지 색 모두 칠해보고 색칠비용의 최솟값을 구한다.
for i in 0...2 {
    // dp[i][j]: i번째집을 j색으로 칠했을 때의 최소비용
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
    // 첫번째 집과 마지막집의 색이 같으면 안되므로, 우리는 첫번째 집의 색을 기억하고 있어야한다.
    // 따라서 첫번쨰 집의 색 이외의 경우의수는 임의의 최댓값을 넣는다.
    for j in 0..<3 {
        if i == j {
            dp[1][j] = arr[1][j]
        } else {
            dp[1][j] = INF
        }
    }
    
    // 규칙에따라 현재집은 이전의 집과 다른색을 칠해야한다.
    // n번째 집까지 색칠한 최소비용: n-1번째까지 칠한 최소비용 + n번째 집의 색칠비용
    for j in 2...N {
        dp[j][0] = arr[j][0] + min(dp[j-1][1], dp[j-1][2])
        dp[j][1] = arr[j][1] + min(dp[j-1][0], dp[j-1][2])
        dp[j][2] = arr[j][2] + min(dp[j-1][0], dp[j-1][1])
    }
    // 첫번째 집과 마지막번째 집의 색이 같지 않다면, 최소비용을 갱신한다.
    for k in 0..<3 {
        if i != k {
            ans = min(ans, dp[N][k])
        }
    }
}
print(ans)
