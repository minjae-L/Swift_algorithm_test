import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[Int]]()
var days = Array(repeating: Array(repeating: 0, count: input[0]), count: input[1])
var needVisitQueue = [[Int]]()
var idx = 0
var endDay = [0,0]
var complete = true

// 상자 배열 입력
// 익은 토마토를 발견할 경우 해당 x,y 인덱스를 시작점 배열에 추가
for i in 0..<input[1] {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
    for j in 0..<arr[i].count {
        if arr[i][j] == 1 {
            needVisitQueue.append([j,i])
        }
    }
}
// 상하좌우 방향
var dx = [0, 1, 0, -1]
var dy = [1, 0, -1, 0]

// 탐색시작점부터 모든 인접한 위치 탐색
while idx < needVisitQueue.count {
    var node = needVisitQueue[idx]
    idx += 1
   
    for i in 0..<4 {
        let nx = node[0] + dx[i]
        let ny = node[1] + dy[i]

        if (nx >= 0 && nx < input[0]) && (ny >= 0 && ny < input[1]) {
            if arr[ny][nx] == 0 {
                arr[ny][nx] = 1
                needVisitQueue.append([nx,ny])
                days[ny][nx] = days[node[1]][node[0]] + 1
                endDay = [nx,ny]
            }
        }
    }
}

// 익지않은 토마토를 발견하면, 모두 익지 못하는 상황이다.
for i in 0..<arr.count {
    for j in 0..<arr[0].count {
        if arr[i][j] == 0 {
            complete = false
        }
    }
}

if complete {
    print(days[endDay[1]][endDay[0]])
} else {
    print(-1)
}

