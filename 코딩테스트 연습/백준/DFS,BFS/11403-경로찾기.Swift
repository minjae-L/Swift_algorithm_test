import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [Int: [Int]]()

// 그래프 입력
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<input.count {
        if input[j] == 1 {
            if graph[i] == nil {
                graph[i] = [j]
            } else {
                graph[i]!.append(j)
            }
        }
    }
}

// DFS
for i in 0..<n {
    var arr = Array(repeating: 0, count: n)
    var needVisitQueue = [Int]()
    if graph[i] != nil {
        needVisitQueue = graph[i]!
        while !needVisitQueue.isEmpty {
            var node = needVisitQueue.removeLast()
            if arr[node] == 1 { continue }
            
            arr[node] = 1
            if graph[node] != nil {
                needVisitQueue += graph[node]!
            }
        }
    }
    print(arr.map{ String($0) }.joined(separator: " "))
}
