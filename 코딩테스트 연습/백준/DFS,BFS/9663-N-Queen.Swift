import Foundation
// 입력받기
let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N)
var visited = Array(repeating: false, count: N)
var result = 0

// 범위 확인
func checkAttakable(index: Int) -> Bool {
    for i in 0..<index {
        // arr[index] == arr[i] : 같은 열에 존재하는가?
        // abs(arr[index] - arr[i]) == abs(index - i) : 대각선방향으로 존재하는가?
        if arr[index] == arr[i] || abs(arr[index] - arr[i]) == abs(index - i) {
            return false
        }
    }
    return true
}

// DFS
func dfs(index: Int) {
    // 모든 행에 배치됬다면 탈출
    if index == N {
        result += 1
        return
    }
    // 주어진 행의 열에 모두 배치해본다.
    for i in 0..<N {
        // 이미 배치된 퀸의 공격범위라면 패스
        if visited[i] { continue }
        arr[index] = i
        // 배치 가능한 곳인지 확인한다.
        if checkAttakable(index: index) {
            visited[i] = true
            // 배치 후 그다음 행에 배치하귀위해 dfs 재귀호출
            dfs(index: index+1)
            // 그 전에 탐색했던 범위를 모두 배치가능으로 돌려놓는다.(백트래킹을 위해)
            visited[i] = false
        }
    }
}

dfs(index: 0)
print(result)
