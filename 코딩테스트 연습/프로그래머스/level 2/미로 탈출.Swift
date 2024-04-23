import Foundation

func solution(_ maps:[String]) -> Int {
    // 입력
    var map = [[String]]()
    var visited = [[Bool]]()
    var counted = [[Int]]()
    var start = (x: 0, y: 0)
    var lever = (x: 0, y: 0)
    var end = (x: 0, y: 0)
    for i in 0..<maps.count {
        let s = maps[i].map{String($0)}
        visited.append(Array(repeating: false, count: s.count))
        counted.append(Array(repeating: 10000000, count: s.count))
        map.append(s)
        for j in 0..<s.count {
            if map[i][j] == "S" {
                start = (x: j, y: i)
            }
            if map[i][j] == "L" {
                lever = (x: j, y: i)
            }
            if map[i][j] == "E" {
                end = (x: j, y: i)
            }
        }
    }
    // BFS
    var needVisit = [(x: start.x, y: start.y)]
    var index = 0
    var dx = [0,1,0,-1]
    var dy = [1,0,-1,0]
    var copyVisited = visited
    var copyCounted = counted
    copyCounted[start.y][start.x] = 0
    // lever위치까지의 BFS
    while index < needVisit.count {
        let cur = needVisit[index]
        
        index += 1
        if cur.x == lever.x && cur.y == lever.y { break }
        for i in 0..<4 {
            let mx = cur.x + dx[i]
            let my = cur.y + dy[i]
            
            if mx < 0 || mx >= map[0].count || my < 0 || my >= map.count {
                continue
            }
            if copyVisited[my][mx] || map[my][mx] == "X" { continue }
            copyVisited[my][mx] = true // 다음 노드를 큐에 넣을때, 이미 탐색된곳이라 지정 (중복탐색방지)
            copyCounted[my][mx] = min(copyCounted[my][mx], copyCounted[cur.y][cur.x] + 1)
            needVisit.append((x: mx, y: my))
        }
    }
    // 레버에 도착하지 못했다면 1000000(임의의 큰수)
    let arriveLeverTime = copyCounted[lever.y][lever.x]
    if arriveLeverTime >= 10000000 { return -1 }
    
    needVisit = [(x: lever.x, y: lever.y)]
    index = 0
    copyCounted = counted
    copyCounted[lever.y][lever.x] = 0
    copyVisited = visited
    // end위치까지의 BFS
    while index < needVisit.count {
        let cur = needVisit[index]
        

        index += 1
        if cur.x == end.x && cur.y == end.y { break }
        for i in 0..<4 {
            let mx = cur.x + dx[i]
            let my = cur.y + dy[i]
            
            if mx < 0 || mx >= map[0].count || my < 0 || my >= map.count {
                continue
            }
            if copyVisited[my][mx] || map[my][mx] == "X" { continue }
            
            copyCounted[my][mx] = min(copyCounted[my][mx], copyCounted[cur.y][cur.x] + 1)
            copyVisited[my][mx] = true // 다음 노드를 큐에 넣을때, 이미 탐색된곳이라 지정 (중복탐색방지)
            needVisit.append((x: mx, y: my))
        }
    }
    // 출구에 도착하지 못했다면 1000000(임의의 큰수)
    let arriveEndTime = copyCounted[end.y][end.x]
    if arriveEndTime >= 10000000 { return -1 }

    return arriveLeverTime + arriveEndTime
}
