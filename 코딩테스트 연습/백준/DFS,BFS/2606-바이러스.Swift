import Foundation

// 입력받기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph = [Int: [Int]]()
// 그래프 형성
for i in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    if graph[input[0]] == nil {
        graph[input[0]] = [input[1]]
    } else {
        graph[input[0]]!.append(input[1])
    }
    if graph[input[1]] == nil {
        graph[input[1]] = [input[0]]
    } else {
        graph[input[1]]!.append(input[0])
    }
}

// DFS
var needVisit = [1]
var visited = [1]
while !needVisit.isEmpty {
    let node = needVisit.removeLast()
    if !visited.contains(node) { visited.append(node) }
    var idx = 0
    while graph[node] != nil && idx < graph[node]!.count {
        if !visited.contains(graph[node]![idx]) {
            needVisit.append(graph[node]![idx])
        }
        idx += 1
    }
}

print(visited.count - 1)
