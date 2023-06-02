import Foundation

var n = Int(readLine()!)!
var arr = [[String]]()
var result = [Int]()

// dif 는 적록색약인지 판단
var dif = false
// x y 방향
var dx = [1,0,-1,0]
var dy = [0,1,0,-1]

// 그립을 배열에 입력
for i in 0..<n {
    var input = Array(readLine()!).map{ String($0) }
    arr.append(input)
}

// 결과 두가지 호출을 위한 result 배열
// 단순히 구역의 수를 구하기위하므로 DFS 이용
while result.count != 2 {
    var needVisitQueue = [(x: Int, y: Int)]()
    var count = 0
    var copyArr = arr
    // 정상인 사람의 구역 수 를 넣으면 색약인사람을 검사
    if result.count == 1 {
        dif = true
    } else {
        dif = false
    }
    // 정상인 사람의 구역의 개수 구하기
    if !dif {
        for i in 0..<copyArr.count {
            for j in 0..<copyArr.count {
                if copyArr[i][j] == "X" { continue }
                needVisitQueue.append((x: j, y: i))
                var check = copyArr[i][j]
                while !needVisitQueue.isEmpty {
                    var node = needVisitQueue.removeLast()
                    copyArr[node.y][node.x] = "X"
                    
                    for k in 0..<4 {
                        var cx = node.x + dx[k]
                        var cy = node.y + dy[k]
                        
                        if (cx >= 0 && cx < n) && (cy >= 0 && cy < n) {
                            if copyArr[cy][cx] == check {
                                needVisitQueue.append((x: cx, y: cy))
                            }
                        }
                    }
                }
                count += 1
            }
        }
        result.append(count)
    } else {
        // 적록색약인 사람의 구역의 개수 구하기
        for i in 0..<copyArr.count {
            for j in 0..<copyArr.count {
                if copyArr[i][j] == "X" { continue }
                needVisitQueue.append((x: j, y: i))
                var check = copyArr[i][j]
                while !needVisitQueue.isEmpty {
                    var node = needVisitQueue.removeLast()
                    copyArr[node.y][node.x] = "X"
                    
                    for k in 0..<4 {
                        var cx = node.x + dx[k]
                        var cy = node.y + dy[k]
                        
                        if (cx >= 0 && cx < n) && (cy >= 0 && cy < n) {
                            if check == "R" || check == "G" {
                                if copyArr[cy][cx] == "R" || copyArr[cy][cx] == "G" {
                                    needVisitQueue.append((x: cx, y: cy))
                                }
                            } else if copyArr[cy][cx] == check {
                                needVisitQueue.append((x: cx, y: cy))
                            }
                        }
                    }
                }
                count += 1
            }
        }
        result.append(count)
    }
}

print(result.map{String($0)}.joined(separator: " "))
