import Foundation

// 입력받기
let N = Int(readLine()!)!
var graph = [Int: [Int]]()
var cost = [0]
var dp = Array(repeating: 0, count: N+1)
var queue = [Int]()
var degree = Array(repeating: 0, count: N+1)
var idx = 0

// 그래프 입력
// 위상정렬에 사용될 degree 진입차수 배열 입력
for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    cost.append(input[0])
    for j in 1..<input.count {
        if input[j] == -1 {continue}
        if graph[input[j]] == nil {
            graph[input[j]] = [i]
        } else {
            graph[input[j]]!.append(i)
        }
        degree[i] += 1
    }
}

// 진입차수가 0인 노드를 큐에 입력
for i in 1...N {
    if degree[i] == 0 {
        queue.append(i)
    }
}

// 위상정렬
while idx < queue.count {
    let node = queue[idx]
    // 현재 노드의 생산시간 더하기
    dp[node] += cost[node]
    idx += 1
    if graph[node] == nil { continue }
    // 인접한 접점의 생산시간은 현재노드의 생산시간과 접점의 생산시간 값중 큰 값을 저장
    for i in graph[node]! {
        degree[i] -= 1
        dp[i] = max(dp[i], dp[node])
        // 입
        if degree[i] == 0 {
            queue.append(i)
        }
    }
}

// 출력
for i in 1...N {
    print(dp[i])
}

