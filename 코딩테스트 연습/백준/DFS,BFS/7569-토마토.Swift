import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let m = input[0]
let n = input[1]
let h = input[2]
var arr = [[[Int]]]()
var a = [[Int]]()
var needVisitQueue = [(x: Int, y: Int, z: Int)]()
var realNeedVisitQueue = [(x: Int, y: Int, z: Int)]()
var result = 0
var cant = false
var dx = [0, 0, 1, 0, -1, 0]
var dy = [0, 0, 0, 1, 0, -1]
var dz = [1, -1, 0, 0, 0, 0]
var z = 0

// 토마토 위치를 배열에 입력
// 입력할때, 토마토의 위치를 저장 (시작점)
for i in 0..<n*h {
    var inp = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<inp.count {
        if inp[j] == 1 {
            realNeedVisitQueue.append((x: j, y: i % n, z: z))
        }
    }
    a.append(inp)
    if (i+1) % n == 0 {
        arr.append(a)
        a.removeAll()
        z += 1
    }
}

// 토마토 익히기 BFS
// 저장해둔 시작점부터 인접한곳에 있는 토마토를 익혀준다.
// 인접한 좌표를 따로 저장하고 익히면 카운트
while !realNeedVisitQueue.isEmpty {
    var saveLocation = [(x: Int, y: Int, z: Int)]()
    needVisitQueue = realNeedVisitQueue
    
    while !needVisitQueue.isEmpty {
        var loc = needVisitQueue.removeLast()
        
        for i in 0..<6 {
            var x1 = loc.x + dx[i]
            var y1 = loc.y + dy[i]
            var z1 = loc.z + dz[i]
            
            if (x1 >= 0 && x1 < m) && (y1 >= 0 && y1 < n) && (z1 >= 0 && z1 < h) {
                if arr[z1][y1][x1] == 0 {
                    arr[z1][y1][x1] = 1
                    saveLocation.append((x: x1, y: y1, z: z1))
                }
            }
        }
    }
    realNeedVisitQueue = saveLocation
    if realNeedVisitQueue.count != 0 {
        result += 1
    }
}

// 마지막으로 익히지않은 토마토가 있는지 검사
for i in 0..<h {
    for j in 0..<n {
        for k in 0..<m {
            if arr[i][j][k] == 0 {
                cant = true
                continue
            }
        }
    }
}
if cant {
    print(-1)
} else {
    print(result)
}

