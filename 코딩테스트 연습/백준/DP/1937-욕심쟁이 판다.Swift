import Foundation

// 입력 받기
let n = Int(readLine()!)!
var arr = [[Int]]()
for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// dp[y][x]: (x,y)에서 최대로 이동할 수 있는 수
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
var result = 0

// 상,하,좌,우 4방향
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

// DFS + DP
// DFS로 깊이 탐색하며, 최대로 이동한 값을 저장한다.
// DP에 저장하는이유: 이미 최대로 이동한 경로를 재탐색 하지 않기 위해서
// 예시) (1 - 2 - 3 - 4)로 이동한게 최대라면, 2번에서 이동경로는 (2 - 3 - 4)를 갖게된다.
// 2번에서 이동한 경로는 이미 탐색된 경로이므로 굳이 다시 탐색하지않아도된다. (가지치기)
func dfs(_ x: Int,_ y: Int) -> Int {
    // 이미 이동했던 경로라면 종료
    if dp[y][x] != 0 { return dp[y][x] }
    // 이동했던 경로로 표시
    dp[y][x] = 1
    // 네방향으로 조건에 맞춰서 이동
    for k in 0..<dx.count {
        let mx = x + dx[k]
        let my = y + dy[k]
        if (mx >= 0 && mx < n) && (my >= 0 && my < n) {
            if arr[my][mx] > arr[y][x] {
                dp[y][x] = max(dp[y][x], dfs(mx, my) + 1)
            }
        }
    }
    return dp[y][x]
}
// 모든 시작점에서 출발해보고, 최댓값을 구한다.
for i in 0..<n {
    for j in 0..<n {
        result = max(result, dfs(j, i))
    }
}
print(result)
