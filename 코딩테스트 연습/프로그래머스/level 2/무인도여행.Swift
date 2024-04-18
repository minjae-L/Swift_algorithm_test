import Foundation

func solution(_ maps:[String]) -> [Int] {
    var result = [Int]()
    var visited = Array(repeating: Array(repeating:false, count: maps[0].count), count: maps.count)
    // 배열로 변환
    var map = [[String]]()
    for i in maps {
        let arr = i.map{String($0)}
        map.append(arr)
    }
    
    // 모든 배열의 원소 탐색(완전탐색 DFS)
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            // 바다가 아니거나 이미 방문한곳이 아니면 탐색시작
            if map[i][j] == "X" || visited[i][j] { continue }
            var sum = 0
            var needVisit = [(x: i,y: j)]
            
            // 인접한곳을 needVisit에 넣고 모든 인접한위치 탐색
            while !needVisit.isEmpty {
                let cur = needVisit.removeLast()
                if visited[cur.x][cur.y] { continue }
                sum += Int(map[cur.x][cur.y])!
                visited[cur.x][cur.y] = true
                var dx = [1, 0, -1, 0]
                var dy = [0, 1, 0, -1]
                for i in 0..<4 {
                    if (cur.y + dy[i] < map[0].count && cur.x + dx[i] < map.count) && (cur.y + dy[i] >= 0 && cur.x + dx[i] >= 0) {
                        if map[cur.x + dx[i]][cur.y + dy[i]] != "X" && !visited[cur.x + dx[i]][cur.y + dy[i]] {
                            needVisit.append((x: cur.x + dx[i], y: cur.y + dy[i]))
                        }
                    }
                }
            }
            result.append(sum)
        }
    }
    result.sort{$0 < $1}
    if result.isEmpty {
        result = [-1]
    }
    return result
}
