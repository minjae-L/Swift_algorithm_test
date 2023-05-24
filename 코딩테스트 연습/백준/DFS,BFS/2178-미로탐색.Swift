import Foundation

// 결과배열 result
// 인접된 인덱스리스트 maze
var index = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [Array(repeating: 0, count: index[1]+2)]
var maze = [[Int]: [[Int]]]()
var result = Array(repeating: Array(repeating: 0, count: index[1]+2), count: index[0]+2)
result[1][1] = 1

// (N+2) * (M+2) 크기의 배열 만들기
for i in 0..<index[0] {
    var nums = Array(readLine()!).map{ Int(String($0))!}
    arr.append([0] + nums + [0])
}
arr.append(Array(repeating: 0, count: index[1]+2))

// 인접리스트 maze 입력하기
for i in 1...index[0] {
    for j in 1...index[1] {
        if arr[i][j] == 1 {
            if arr[i-1][j] == 1 {
                if maze[[i,j]] == nil {
                    maze[[i,j]] = [[i-1,j]]
                } else {
                    maze[[i,j]]!.append([i-1,j])
                }
            }
            if arr[i][j-1] == 1 {
                if maze[[i,j]] == nil {
                    maze[[i,j]] = [[i,j-1]]
                } else {
                    maze[[i,j]]!.append([i,j-1])
                }
            }
            if arr[i+1][j] == 1 {
                if maze[[i,j]] == nil {
                    maze[[i,j]] = [[i+1,j]]
                } else {
                    maze[[i,j]]!.append([i+1,j])
                }
            }
            if arr[i][j+1] == 1 {
                if maze[[i,j]] == nil {
                    maze[[i,j]] = [[i,j+1]]
                } else {
                    maze[[i,j]]!.append([i,j+1])
                }
            }
        }
    }
}

// 방문한 위치 배열
// 방문해야 할 위치 배열
var visitedQueue = [[Int]]()
var needVisitQueue = [[1,1]]

// BFS
while !needVisitQueue.isEmpty {
    var node = needVisitQueue.removeFirst()
    
    if visitedQueue.contains(node) { continue }
    visitedQueue.append(node)
    needVisitQueue += maze[node]!
    // 해당 위치가 시작지점이면 패스
    // 해당위치 이전의 방문한 위치가 있다면 그 위치의값 + 1
    if node == [1,1] {
        continue
    } else {
        for i in maze[node]! {
            if visitedQueue.contains(i) {
                result[node[0]][node[1]] += result[i[0]][i[1]] + 1
                break
            }
        }
    }
}

print(result[index[0]][index[1]])
