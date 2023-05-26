import Foundation

let size = Int(readLine()!)!
var arr = [[Int]]()
var graph = [[Int]: [[Int]]]()
var result = [Int]()

// 주어진 지도를 배열로 입력
for i in 0..<size {
    arr.append(readLine()!.map{Int(String($0))!})
}

// 배열을 통해 집과 인접한 집들의 위치를 저장한다.
// 주변에 인접한 집이 없어도, 자신의 집 한채로 단지를 이룬다고 보기에 자신의 위치 x,y도 리스트에 저장한다.
for i in 0..<size {
    for j in 0..<size {
        if arr[i][j] == 1 {
            if graph[[i,j]] == nil {
                graph[[i,j]] = [[i,j]]
            } else {
                graph[[i,j]]!.append([i,j])
            }
            if i > 0 && arr[i-1][j] == 1 {
                if graph[[i,j]] == nil {
                    graph[[i,j]] = [[i-1, j]]
                } else if !graph[[i,j]]!.contains([i-1,j]) {
                    graph[[i,j]]!.append([i-1,j])
                }
                if graph[[i-1,j]] == nil {
                    graph[[i-1,j]] = [[i, j]]
                } else if !graph[[i-1,j]]!.contains([i,j]) {
                    graph[[i-1,j]]!.append([i,j])
                }
            }
            if j < size-1 && arr[i][j+1] == 1 {
                if graph[[i,j]] == nil {
                    graph[[i,j]] = [[i, j+1]]
                } else if !graph[[i,j]]!.contains([i,j+1]) {
                    graph[[i,j]]!.append([i,j+1])
                }
                if graph[[i,j+1]] == nil {
                    graph[[i,j+1]] = [[i, j]]
                } else if !graph[[i,j+1]]!.contains([i,j]) {
                    graph[[i,j+1]]!.append([i,j])
                }
            }
            if i < size-1 && arr[i+1][j] == 1 {
                if graph[[i,j]] == nil {
                    graph[[i,j]] = [[i+1, j]]
                } else if !graph[[i,j]]!.contains([i+1,j]) {
                    graph[[i,j]]!.append([i+1,j])
                }
                if graph[[i+1,j]] == nil {
                    graph[[i+1,j]] = [[i, j]]
                } else if !graph[[i+1,j]]!.contains([i,j]) {
                    graph[[i+1,j]]!.append([i,j])
                }
            }
            if j > 0 && arr[i][j-1] == 1 {
                if graph[[i,j]] == nil {
                    graph[[i,j]] = [[i, j-1]]
                } else if !graph[[i,j]]!.contains([i,j-1]) {
                    graph[[i,j]]!.append([i,j-1])
                }
                if graph[[i,j-1]] == nil {
                    graph[[i,j-1]] = [[i, j]]
                } else if !graph[[i,j-1]]!.contains([i,j]) {
                    graph[[i,j-1]]!.append([i,j])
                }
            }
        }
    }
}


var totalVisited = [[Int]]()
var visitedQueue = [[Int]]()
var needVisitedQueue = [[Int]]()

// 그래프 탐색의 순서가 의미없기에, 배열을 순회하며 집을 발견하면 단지 탐색을 한다.
// BFS를 사용했다. (DFS를 사용해도 무관)
// 단지을 탐색후 발견한 집의 개수를 따로 저장하고, 발견한 집들의 위치는 다시 탐색할 필요가 없다.
for i in 0..<size {
    for j in 0..<size {
        if arr[i][j] == 1 && !totalVisited.contains([i,j]) {
            needVisitedQueue = [[i,j]]

            while !needVisitedQueue.isEmpty {
                var node = needVisitedQueue.removeFirst()
                if visitedQueue.contains(node) { continue }
                visitedQueue.append(node)

                needVisitedQueue += graph[node]!
            }
            totalVisited += visitedQueue
            result.append(visitedQueue.count)
            visitedQueue.removeAll()
        }
    }
}
result.sort{ $0 < $1 }
print(result.count)
for i in result {
    print(i)
}
