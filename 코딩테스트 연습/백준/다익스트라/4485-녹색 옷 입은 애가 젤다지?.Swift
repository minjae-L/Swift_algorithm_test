import Foundation

var index = 1
while true {
    // 입력받기
    let N = Int(readLine()!)!
    if N == 0 { break }
    var graph = [[Int]]()
    var md = Array(repeating: Array(repeating: 1000000, count: N), count: N)
    for i in 0..<N {
        graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    md[0][0] = graph[0][0]
    var queue = [(x: 0, y: 0, cost: graph[0][0])]
    var dx = [0,1,0,-1]
    var dy = [1,0,-1,0]
    
    // 다익스트라
    while !queue.isEmpty {
        let node = queue.removeLast()
        // 맨 오른쪽아래에 도달하면 멈춤
        // 최단거리가 가장 적은것 우선순위로 탐색하기때문에, 멈춰도된다. 선형탐색이라면 정답이 아닐수도 있다.
        if node.x == N-1 && node.y == N-1 { break }
        // 인접한 위치들 선택
        for i in 0..<4 {
            let mx = node.x + dx[i]
            let my = node.y + dy[i]
            if mx >= N || mx < 0 || my >= N || my < 0 { continue }
            if md[my][mx] > md[node.y][node.x] + graph[my][mx]{
                md[my][mx] = md[node.y][node.x] + graph[my][mx]
                queue.append((x: mx, y: my, cost: md[my][mx]))
            }
        }
        // 큐의 우선순위를 루피가 가장적은것 우선(배열의 마지막을 뽑기때문에 내림차순으로 한다.)
        queue.sort{ $0.cost > $1.cost }
    }
    print("Problem \(index): \(md[N-1][N-1])")
    index += 1
}
