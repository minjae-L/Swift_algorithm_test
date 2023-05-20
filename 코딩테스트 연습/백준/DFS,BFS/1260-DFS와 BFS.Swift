import Foundation

let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var dict = [Int: [Int]]()

// 그래프 입력
for i in 0..<inputs[1] {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    if dict[input[0]] == nil {
        dict[input[0]] = [input[1]]
    } else if !dict[input[0]]!.contains(input[1]) {
        dict[input[0]]!.append(input[1])
    }
    if dict[input[1]] == nil {
        dict[input[1]] = [input[0]]
    } else if !dict[input[1]]!.contains(input[0]) {
        dict[input[1]]!.append(input[0])
    }
}

var visitedQueue = [Int]()
var visitedQueue2 = [Int]()
var needVisitStack = [inputs[2]]

// DFS
// 인접한 접점번호가 작은순이므로, 접점번호가 저장된배열을 내림차순으로 정렬한다.
while !needVisitStack.isEmpty {
    let node = needVisitStack.removeLast()
    if visitedQueue.contains(node) { continue }
    
    visitedQueue.append(node)
    needVisitStack += dict[node]?.sorted{ $0 > $1 } ?? []
}

// BFS
// 인접한 접점번호가 작은순이므로, 접점번호가 저장된배열을 오름차순으로 정렬한다.
needVisitStack = [inputs[2]]
while !needVisitStack.isEmpty {
    let node = needVisitStack.removeFirst()
    if visitedQueue2.contains(node) { continue }
    
    visitedQueue2.append(node)
    needVisitStack += dict[node]?.sorted{ $0 < $1 } ?? []
}

print(visitedQueue.map{ String($0)}.joined(separator: " "))
print(visitedQueue2.map{ String($0)}.joined(separator: " "))
