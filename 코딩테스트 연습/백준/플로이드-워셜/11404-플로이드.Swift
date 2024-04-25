import Foundation

// 입력
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 1000000000, count: n+1), count: n+1)

// 인접행렬
for _ in 0..<m {
    let bus = readLine()!.split(separator: " ").map{Int(String($0))!}
    if graph[bus[0]][bus[1]] > bus[2] {
        graph[bus[0]][bus[1]] = bus[2]
    }
}
// i도시는 i도시로 갈 수 없다.
for i in 1...n {
    graph[i][i] = 0
}

// 플로이드-워셜 알고리즘
for m in 1...n {
    for i in 1...n {
        for j in 1...n {
            let im = graph[i][m]
            let mj = graph[m][j]
            graph[i][j] = min(graph[i][j], graph[i][m] + graph[m][j])
        }
    }
}

// 최단거리를 구하기위해 비교값으로 큰 값을 주었는데, 이동할 수 없음을 0으로 변환
for i in 0..<graph.count {
    for j in 0..<graph[0].count {
        if graph[i][j] == 1000000000 { graph[i][j] = 0 }
    }
}

// 출력
for i in 1..<graph.count {
    var answer = ""
    for j in 1..<graph[i].count {
        if j == graph[i].count - 1 {
            answer += "\(graph[i][j])"
        } else {
            answer += "\(graph[i][j]) "
        }
    }
    print(answer)
}
