import Foundation

let count = Int(readLine()!)!

for i in 0..<count {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    var arr = Array(repeating: Array(repeating: 0, count: input[0]), count: input[1])
    var graph = [[Int]: [[Int]]]()
    var result = 0
    
    // 주어진 땅을 배열로 입력
    for j in 0..<input[2] {
        var idx = readLine()!.split(separator: " ").map{ Int($0)! }
        arr[idx[1]][idx[0]] = 1
    }
    
    // 땅에 심어진 배추와 인접한 배추들의 위치를 연결리스트로 입력
    // [[x,y] : [[인접한 배추들의 위치들]]
    // 인접한 배추가 없는경우 자신의 위치 한곳에도 지렁이가 필요하므로 자신의 위치도 입력한다.
    for j in 0..<arr.count {
        for k in 0..<arr[0].count {
            if arr[j][k] == 0 { continue }
            if graph[[j,k]] == nil {
                graph[[j,k]] = [[j,k]]
            } else {
                graph[[j,k]]!.append([j,k])
            }
            if j > 0 && arr[j-1][k] == 1 {
                if !graph[[j,k]]!.contains([j-1, k]) {
                    graph[[j,k]]!.append([j-1,k])
                }
                if graph[[j-1,k]] == nil {
                    graph[[j-1,k]] = [[j,k]]
                } else {
                    if !graph[[j-1,k]]!.contains([j,k]) {
                        graph[[j-1,k]]!.append([j,k])
                    }
                }
            }
            if j < arr.count-1 && arr[j+1][k] == 1 {
                if !graph[[j,k]]!.contains([j+1, k]) {
                    graph[[j,k]]!.append([j+1,k])
                }
                if graph[[j+1,k]] == nil {
                    graph[[j+1,k]] = [[j,k]]
                } else {
                    if !graph[[j+1,k]]!.contains([j,k]) {
                        graph[[j+1,k]]!.append([j,k])
                    }
                }
            }
            if k > 0 && arr[j][k-1] == 1 {
                if !graph[[j,k]]!.contains([j, k-1]) {
                    graph[[j,k]]!.append([j,k-1])
                }
                if graph[[j,k-1]] == nil {
                    graph[[j,k-1]] = [[j,k]]
                } else {
                    if !graph[[j,k-1]]!.contains([j,k]) {
                        graph[[j,k-1]]!.append([j,k])
                    }
                }
            }
            if k < arr[0].count-1 && arr[j][k+1] == 1 {
                if !graph[[j,k]]!.contains([j, k+1]) {
                    graph[[j,k]]!.append([j,k+1])
                }
                if graph[[j,k+1]] == nil {
                    graph[[j,k+1]] = [[j,k]]
                } else {
                    if !graph[[j,k+1]]!.contains([j,k]) {
                        graph[[j,k+1]]!.append([j,k])
                    }
                }
            }
        }
    }
    
    // 인접한 배추들을 탐색하는데 순서가 중요하지 않으므로 BFS, DFS 둘다 사용가능하다.
    // 여기서는 BFS를 사용했다.
    var totalVisitedQueue = [[Int]]()
    var visitedQueue = [[Int]]()
    var needVisitQueue = [[Int]]()
    
    for j in 0..<arr.count {
        for k in 0..<arr[0].count {
            if arr[j][k] == 1 && !totalVisitedQueue.contains([j,k]) {
                needVisitQueue = [[j,k]]
                
                while !needVisitQueue.isEmpty {
                    var node = needVisitQueue.removeFirst()
                    if visitedQueue.contains(node) { continue }
                    visitedQueue.append(node)
                    
                    needVisitQueue += graph[node]!
                }
                totalVisitedQueue += visitedQueue
                result += 1
                visitedQueue.removeAll()
            }
        }
    }
    print(result)
    
}
