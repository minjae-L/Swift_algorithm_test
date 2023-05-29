import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: Array(repeating: -1, count: input[1]), count: input[0])
var arr = [[Int]]()
var dy = [0,1,0,-1]
var dx = [1,0,-1,0]

// 지도를 배열로 입력
for i in 0..<input[0] {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// DFS 재귀호출
// 상하좌우 방향이 현재위치보다 작은경우 이동가능한 곳이다.
// dp의 초기값은 -1이므로 새롭게 가는곳이다.
func dfs(_ x: Int, _ y: Int) -> Int {
    // 목적지에 도착하면 1반환
    if x == input[1] - 1 && y == input[0] - 1 {
        return 1
    }
    // 처음가보는곳이라면 해당위치의 상하좌우방향중 이동할 수 있는 곳으로 재귀호출
    if dp[y][x] == -1 {
        dp[y][x] = 0
        for i in 0..<4 {
            var ny = y + dy[i]
            var nx = x + dx[i]

            if (ny >= 0 && ny < input[0]) && (nx >= 0 && nx < input[1] ) {
                if arr[ny][nx] < arr[y][x] {
                    dp[y][x] += dfs(nx, ny)
                }
            }
        }
    }
    // 이미 이동했던곳이라면 저장된 DP값을 반환
    return dp[y][x]
}

print(dfs(0, 0))
