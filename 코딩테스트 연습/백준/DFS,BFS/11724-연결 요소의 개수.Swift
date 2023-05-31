import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var graph = [Int: [Int]]()
var start = [Int]()
var result = 0
var visitedQueue = [Int]()
var needVisitQueue = [Int]()

// 연결리스트 작성
for i in 0..<input[1] {
    var inp = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if graph[inp[0]] == nil {
        graph[inp[0]] = [inp[1]]
    } else {
        graph[inp[0]]!.append(inp[1])
    }
    if graph[inp[1]] == nil {
        graph[inp[1]] = [inp[0]]
    } else {
        graph[inp[1]]!.append(inp[0])
    }
    
    if !start.contains(inp[0]) {
        start.append(inp[0])
    }
    if !start.contains(inp[1]) {
        start.append(inp[1])
    }
}

// 연결되어 있지 않은 점도 본인의 점으로 연결
for i in 1...input[0] {
    if graph[i] == nil {
        graph[i] = [i]
        start.append(i)
    }
    
}

// 주어진 점 모두 탐색할때까지 DFS
while visitedQueue.count != start.count {
    var node = 0
    for i in 0..<start.count {
        if !visitedQueue.contains(start[i]) {
            node = start[i]
            break
        }
    }
    needVisitQueue.append(node)
    result += 1
    
    while !needVisitQueue.isEmpty {
        var n = needVisitQueue.removeLast()
        if visitedQueue.contains(n) { continue }
        visitedQueue.append(n)
        
        needVisitQueue += graph[n]!
    }
}

print(result)
