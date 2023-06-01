import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[Int]]()
var startIdx = [[Int]]()
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var max = Int.min

// 주어진 연구소의 구조를 배열로 입력
// 바이러스 시작지점 저장
for i in 0..<input[0] {
    var a = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(a)
    for j in 0..<arr[i].count {
        if arr[i][j] == 2 {
            startIdx.append([i,j])
        }
    }
}

// DFS
// 벽을 총 3개 세우는 모든 경우의 수
// 벽 3개를 세웠다면 바이러스를 퍼뜨림(BFS)
func walls(_ num: Int) {
    if num == 3 {
        bfs()
        return
    }
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if arr[i][j] == 0 {
                arr[i][j] = 1
                walls(num+1)
                arr[i][j] = 0
            }
        }
    }
}

// BFS
// 벽이 세워졌다면 바이러스를 퍼뜨린다.
// 모든 바이러스가 퍼진 후 안전구역의 수를 센다.
// 안전구역 최대값 최신화
func bfs() {
    var cp = [[Int]]()
    for i in 0..<input[0] {
        cp.append(arr[i])
    }
    
    var needVisitQueue = startIdx
    var idx = 0

    while !needVisitQueue.isEmpty {
        var node = needVisitQueue.removeFirst()
        
        for j in 0..<4 {
            var x = node[0] + dx[j]
            var y = node[1] + dy[j]

            if (x >= 0 && x < input[0]) && (y >= 0 && y < input[1]) && cp[x][y] == 0 {
                cp[x][y] = 2
                needVisitQueue.append([x,y])
            }
        }
    }
    
    var c = 0
    for i in 0..<cp.count {
        for j in 0..<cp[0].count {
            if cp[i][j] == 0 {
                c += 1
            }
        }
    }
    if max < c {
        max = c
    }
}

walls(0)
print(max)
