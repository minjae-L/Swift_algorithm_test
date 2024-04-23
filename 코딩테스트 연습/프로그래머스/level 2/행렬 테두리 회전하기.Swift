import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var board = Array(repeating:Array(repeating: 0, count: columns+1), count: rows+1)
    var answer = [Int]()
    
    for i in 1...rows {
        for j in 1...columns {
            board[i][j] = ((i-1) * columns + j)
        }
    }
    
    var b = board
    for query in queries {
        var a = moveNums(query, b)
        var minNum = a.removeLast()
        answer += minNum
        b = a
    }
    
    return answer
}

func moveNums(_ query: [Int],_ arr: [[Int]]) -> [[Int]] {
    var dx = [1, 0, -1, 0]
    var dy = [0, 1,  0, -1]
    var a = arr
    var mx = query[1]
    var my = query[0]
    var rc = query[3] - query[1]
    var cc = query[2] - query[0]
    var previous = a[my][mx]
    var minNum = a[my][mx]
    
    for i in 0..<4 {
        if i == 0 || i == 2 {
            for j in 0..<rc {
                mx += dx[i]
                my += dy[i]
                minNum = min(minNum, a[my][mx])
                var tmp = a[my][mx]
                a[my][mx] = previous
                previous = tmp
                
            }
        } else {
            for j in 0..<cc {
                mx += dx[i]
                my += dy[i]
                minNum = min(minNum, a[my][mx])
                var tmp = a[my][mx]
                a[my][mx] = previous
                previous = tmp
                
            }
        }
    }
    
    a.append([minNum])
    return a
}
