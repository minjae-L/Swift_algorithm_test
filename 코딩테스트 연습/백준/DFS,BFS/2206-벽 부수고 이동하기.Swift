import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[Int]]()
for i in 0..<input[0] {
    let a = Array(readLine()!).map{ Int(String($0))! }
    arr.append(a)
}

// 최단경로를 기록할 visited 배열과 BFS를 이용할 needVistedQueue 배열
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: input[1]), count: input[0]), count: 2)
var needVisitQueue = [(x: Int, y: Int, z: Int)]()

// 상하좌우 방향
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

// 결과 변수
var result = Int.max

// 출발지점 설정과 출발지점도 최단경로에 세므로 1로 초기화
needVisitQueue.append((x: 0, y: 0, z: 0))
visited[0][0][0] = 1


// BFS
var idx = 0
while idx < needVisitQueue.count {
    var loc = needVisitQueue[idx]
    idx += 1
    
    // 목표지점에 도착한 경우 최단경로 갱신
    if loc.x == input[0] - 1 && loc.y == input[1] - 1 {
        if result > visited[loc.z][loc.x][loc.y] && visited[loc.z][loc.x][loc.y] != 0 {
            result = visited[loc.z][loc.x][loc.y]
        }
        continue
    }
    for i in 0..<4 {
        let mx = dx[i] + loc.x
        let my = dy[i] + loc.y
        let mz = loc.z

        if mx >= 0 && mx < input[0] && my >= 0 && my < input[1] {
            // 다음 위치로 이동 할 수 있고, 아직 방문하지않은곳이라면
            if arr[mx][my] == 0 && visited[mz][mx][my] == 0 {
                visited[mz][mx][my] = visited[loc.z][loc.x][loc.y] + 1
                needVisitQueue.append((x: mx, y: my, z: mz))
            }
            // 다음 위치가 벽이고 아직 부수지 않았다면
            if arr[mx][my] == 1 && mz == 0 {
                visited[mz+1][mx][my] = visited[loc.z][loc.x][loc.y] + 1
                needVisitQueue.append((x: mx, y: my, z: mz + 1))
            }
        }
    }
}

if result == Int.max {
    print(-1)
} else {
    print(result)
}

