import Foundation

// 부모노드배열, 트리 연결리스트
let count = Int(readLine()!)!
var tree = [Int: [Int]]()
var parent = Array(repeating: 0, count: count+1)

// 연결리스트 입력
for i in 0..<count-1 {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    if tree[input[0]] == nil {
        tree[input[0]] = [input[1]]
    } else {
        tree[input[0]]!.append(input[1])
    }
    if tree[input[1]] == nil {
        tree[input[1]] = [input[0]]
    } else {
        tree[input[1]]!.append(input[0])
    }
}

// 시작점은 루트노드 1
var needVisitQueue = [1]

// BFS
// 인접한 노드 탐색
// 이미 탐색한 곳은 제외하고 새롭게 탐색한다.
// 인접한 노드의 부모노드는 이전에 탐색된 노드번호가 된다.
while !needVisitQueue.isEmpty {
    var node = needVisitQueue.removeLast()
    var arr = [Int]()
    for i in tree[node]! {
        if parent[i] == 0 && i != node {
            parent[i] = node
            arr.append(i)
        }
    }
    needVisitQueue += arr
}

// 부모노드 출력
for i in 2...count {
    print(parent[i])
}
