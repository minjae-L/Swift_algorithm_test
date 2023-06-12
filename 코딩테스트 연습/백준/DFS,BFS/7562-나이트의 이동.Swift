import Foundation

let c = Int(readLine()!)!

// 나이트의 이동
var dx = [1, 2, -1, -2, 1, 2, -1, -2]
var dy = [2, 1, -2, -1, -2, -1, 2, 1]

for i in 0..<c {
    var len = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: len), count: len)
    var dp = Array(repeating: Array(repeating: 0, count: len), count: len)
    var s = readLine()!.split(separator: " ").map{ Int($0)! }
    var d = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var needVisitQueue = [(x: s[0], y: s[1])]
    
    // BFS
    // 나이트를 움직일때 도착점이 탐색하지 않은곳이라면 +1 카운트
    // 이미 도착했던곳이라면 스킵한다.
    while !needVisitQueue.isEmpty {
        var loc = needVisitQueue.removeFirst()
        if loc.x == d[0] && loc.y == d[1] { break }
        
        for i in 0..<8 {
            var mx = loc.x + dx[i]
            var my = loc.y + dy[i]
            
            if (mx >= 0 && mx < len) && (my >= 0 && my < len) && (dp[mx][my] == 0){
                dp[mx][my] = dp[loc.x][loc.y] + 1
                needVisitQueue.append((x: mx, y: my))
            }
        }
    }
    print(dp[d[0]][d[1]])
}
