import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()
var max = 0
var result = 0
// 상하좌우 방향
var dx = [1,0,-1,0]
var dy = [0,1,0,-1]

// 주어진 N * N 배열 입력
// 높이의 최대값 저장
for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
    if max < arr[i].max()! {
        max = arr[i].max()!
    }
}

// BFS
// 비가 아예오지않는 0 부터 최대높이 max까지 오는 모든 경우의 수 조사
// 비의 높이보다 큰 안전한영역의 개수 카운트하고, 최대값 갱신
for i in 0...max {
    var needVisitQueue = [(x:Int, y: Int)]()
    var copy = arr
    var count = 0
    for j in 0..<n {
        for k in 0..<n {
            if copy[j][k] > i {
                needVisitQueue = [(x: k, y: j)]
                copy[j][k] = -1
                while !needVisitQueue.isEmpty {
                    var loc = needVisitQueue.removeLast()
                    
                    for m in 0..<4 {
                        var x1 = loc.x + dx[m]
                        var y1 = loc.y + dy[m]
                        
                        if (x1 >= 0 && x1 < n) && (y1 >= 0 && y1 < n) {
                            if copy[y1][x1] > i {
                                copy[y1][x1] = -1
                                needVisitQueue.append((x: x1, y: y1))
                            }
                        }
                    }
                }
                count += 1
            }
        }
    }
    
    if count > result {
        result = count
    }
}
print(result)
