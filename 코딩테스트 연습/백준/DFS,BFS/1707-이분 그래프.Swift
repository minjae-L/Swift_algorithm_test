import Foundation

// 테스트케이스 수
let K = Int(readLine()!)!

for i in 0..<K {
    // 입력받기
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let V = input[0], E = input[1]
    var graph = [Int: [Int]]()
    for j in 0..<E {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if graph[input[0]] == nil {
            graph[input[0]] = [input[1]]
        } else {
            graph[input[0]]?.append(input[1])
        }
        if graph[input[1]] == nil {
            graph[input[1]] = [input[0]]
        } else {
            graph[input[1]]?.append(input[0])
        }
    }
    
    var visited = Array(repeating: 0, count: V+1)
    var isBinaryGraph = true
    
    // BFS
    // 그래프 정점을 이분했을때 두개의 집합으로 나누자 1번집합과 -1번집합
    // visited 0: 방문하지않음, 1: 1번집합에 속함, -1: -1번집합에 속함
    // BFS탐색을 통해 인접한 접점은 현재 집합과 다른 집합에 속해야한다.
    // 만약 현재 노드의 접점과 인접한 접점이 같은 집합에 속한다면, 이분그래프로 나타낼 수 없다.
    for i in 1...V {
        if visited[i] != 0 { continue }
        var needVisit = [i]
        visited[i] = 1
        var idx = 0
        while idx < needVisit.count {
            let node = needVisit[idx]
            let color = visited[node] == 1 ? -1 : 1
            if graph[node] == nil { break }
            for j in graph[node]! {
                if visited[j] != 0 {
                    if visited[node] == visited[j] {
                        isBinaryGraph = false
                        break
                    }
                } else {
                    visited[j] = color
                    needVisit.append(j)
                }
            }
            if !isBinaryGraph { break }
            idx += 1
        }
    }
    if isBinaryGraph {
        print("YES")
    } else {
        print("NO")
    }
}
