import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2], X = input[3]
var md = Array(repeating: 1000000, count: N+1)
var graph = [Int: [Int]]()

// 인접리스트
for i in 0..<M {
    let road = readLine()!.split(separator: " ").map{Int(String($0))!}
    if graph[road[0]] == nil {
        graph[road[0]] = [road[1]]
    } else {
        graph[road[0]]!.append(road[1])
    }
}

var queue = [(cur: X, cost: 0)]
md[X] = 0
// 다익스트라
while !queue.isEmpty {
    let node = queue.removeLast()
    var next = graph[node.cur]
    // 그다음 인접노드가 없거나 이미 K보다 크다면 의미가 없으므로 건너뜀
    if next == nil || node.cost > K { continue }
    // 인접한 노드들의 최단거리정보를 저장하고, 다음 노드 탐색
    for i in next! {
        if md[i] > md[node.cur] + 1 {
            md[i] = md[node.cur] + 1
            queue.append((cur: i, cost:md[i]))
        }
    }
    
}

// 출력
var find = false
for i in 0..<md.count {
    if md[i] == K {
        find = true
        print(i)
    }
}

if !find {
    print(-1)
}
