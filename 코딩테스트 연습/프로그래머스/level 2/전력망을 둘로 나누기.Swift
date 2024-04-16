import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = Int.max
    var arr = wires
    // 끊을 전선 모두 탐색
    for i in 0..<arr.count {
        var visited = [Int]()
        var needVisit = [Int]()
        var count = 0
        var node = [Int: [Int]]()
        
        // 끊을 전선을 제외한 나머지 전선으로 그래프 형성
        for j in 0..<arr.count {
            if i == j { continue}
            let start = arr[j][0]
            let arrive = arr[j][1]
            if node[start] == nil {
                node[start] = [arrive]
            } else {
                node[start]!.append(arrive)
            }
            if node[arrive] == nil {
                node[arrive] = [start]
            } else {
                node[arrive]!.append(start)
            }
        }
        
        // DFS
        needVisit = [node.first!.key]
        while !needVisit.isEmpty {
            var top = needVisit.removeLast()
            if !visited.contains(top) {
                count += 1
                visited.append(top)
                needVisit += node[top]!
            }
        }
        // | count - (n- count) |
        answer = min(answer, abs(count - (n-count)))
    }
    return answer
}
