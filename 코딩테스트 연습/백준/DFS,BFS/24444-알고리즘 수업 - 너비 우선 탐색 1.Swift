import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], R = input[2]
var needVisit = [R]
var visited = Array(repeating: false, count: N+1)
var graph = [Int: [Int]]()
var answer = Array(repeating: 0, count: N+1)
for i in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = input[0], e = input[1]
    if graph[s] == nil {
        graph[s] = [e]
    } else {
        graph[s]?.append(e)
    }
    if graph[e] == nil {
        graph[e] = [s]
    } else {
        graph[e]?.append(s)
    }
}
// 너비우선탐색 오름차순탐색을 위해 오름차순으로 정렬
for i in 1...N {
    graph[i]?.sort{$0 < $1}
}

// 시작점은 따로 저장
var idx = 2
var nodeIdx = 0
visited[R] = true
answer[R] = 1
// BFS
while nodeIdx < needVisit.count {
    let node = needVisit[nodeIdx]
    nodeIdx += 1
    // 처음 방문한 지점이라면 순서를 입력
    if answer[node] == 0 {
        answer[node] = idx
        idx += 1
    }
    // 시작점과 인접한 접점이 없는경우
    if graph[node] == nil {
        continue
    }
    // 인접점중 방문하지않은 곳을 다음 방문순서로 넣는다.
    for i in graph[node]! {
        if !visited[i] {
            needVisit.append(i)
            visited[i] = true
        }
    }
}
// 출력
for i in 1...N {
    print(answer[i])
}
