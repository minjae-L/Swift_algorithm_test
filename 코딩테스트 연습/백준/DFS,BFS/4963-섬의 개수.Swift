import Foundation

// 8가지 방향
var dx = [0, 1, 1, 1, 0, -1, -1, -1]
var dy = [1, 1, 0, -1, -1, -1, 0, 1]

// DFS
while true {
    // 0 0 입력시 반복탈출
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    let w = input[0]
    let h = input[1]
    if w == h && h == 0 {
        break
    }
    
    // DFS 탐색을 위한 변수
    var needVisitQueue = [(x: Int, y: Int)]()
    var finalVisitedQueue = [(x: Int, y: Int)]()
    var count = 0
    var arr = [[Int]]()

    // 배열로 입력받아 1의 위치를 저장해둔다.
    for i in 0..<h {
        arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        for j in 0..<arr[i].count {
            if arr[i][j] == 1 {
                finalVisitedQueue.append((x: j, y: i))
            }
        }
    }
    
    // 1과 인접한 모든 위치중 값이 1인곳을 모두 탐색 후 카운트
    while !finalVisitedQueue.isEmpty {
        needVisitQueue = [finalVisitedQueue.removeLast()]
        if arr[needVisitQueue[0].y][needVisitQueue[0].x] == -1 { continue }
        while !needVisitQueue.isEmpty {
            var loc = needVisitQueue.removeLast()
            arr[loc.y][loc.x] = -1
            for i in 0..<8 {
                var x1 = loc.x + dx[i]
                var y1 = loc.y + dy[i]
                
                if (x1 >= 0 && x1 < w) && (y1 >= 0 && y1 < h) {
                    if arr[y1][x1] == 1 {
                        needVisitQueue.append((x: x1, y:y1))
                    }
                }
            }
        }
        count += 1
    }
    print(count)
}
