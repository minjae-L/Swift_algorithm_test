import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var graph = [Int: [(loc: Int, cost: Int)]]()
let INF: Int = 20000000000

// 그래프 입력받기
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    if graph[input[0]] == nil {
        graph[input[0]] = [(loc: input[1], cost: input[2])]
    } else {
        graph[input[0]]?.append((loc: input[1], cost: input[2]))
    }
}
// 벨만포드알고리즘 결과를 저장
var answer = bellmanFord(graph: graph, start: 1, N: N)

// 음의 사이클이 존재하는 경우 -1
// 존재하지 않는경우 각 지점의 최단거리 출력
if answer.0 {
    print(-1)
} else {
    for i in 2...N {
        if answer.1[i] == INF {
            print(-1)
        } else {
            print(answer.1[i])
        }
    }
}

// 벨만포드 알고리즘
// 다익스트라처럼 인접한 지점과의 거리로 최단거리를 갱신한다.
// 갱신 횟수는 N-1회 하여 갱신한다.(N: 노드의 갯수)
// 벨만포드 알고리즘은 음의 가중치를 가질 수 있고, 음의 사이클이 존재할 수 있다.
// 최단거리의 간선 경로 횟수는 최대 N-1개만 가질 수 있으므로 N-1회 반복하지만 N번째에도 최단거리가 갱신이 된다면, 이는 음의 사이클이 존재한다고 판단할 수 있다.
func bellmanFord( graph: [Int: [(loc: Int, cost: Int)]], start: Int, N: Int) -> (Bool, [Int]) {
    var minDistance = Array(repeating: INF, count: N+1)
    minDistance[start] = 0
    
    for i in 0...N {
        for node in 1...N {
            if graph[node] == nil { continue }
            for k in graph[node]! {
                if minDistance[node] != INF && minDistance[k.loc] > minDistance[node] + k.cost {
                    minDistance[k.loc] = minDistance[node] + k.cost
                    // N번째에도 최단거리가 갱신이 된다면 음의 사이클이 존재한다고 판단
                    if i == N {
                        return (true, minDistance)
                    }
                }
            }
        }
    }
    return (false, minDistance)
}
 
