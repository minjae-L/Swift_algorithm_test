import Foundation

// 입력받기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
// 분리집합
var parent = Array(repeating: 0, count: N+1)
var isPossible = true
// 분리집합의 각 원소는 초기에 자신을 루트노드로 갖는다.
for i in 1...N {
    parent[i] = i
}
// 원소의 루트노드를 찾는 함수
func find(_ x: Int) -> Int {
    if parent[x] == x { return x}
    parent[x] = find(parent[x])
    
    return parent[x]
}

// 서로 다른 분리집합을 합치는 함수
func union(_ x: Int,_ y: Int) {
    let rootX = find(x)
    let rootY = find(y)
    
    parent[rootY] = rootX
}
// 주어진 연결정보를 토대로 분리집합을 합친다.
for i in 0..<N {
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<arr.count {
        if arr[j] == 1 {
            union(i+1, j+1)
        }
    }
}

let a = readLine()!.split(separator: " ").map{Int(String($0))!}
var root = -1
// 해당 도시가 연결되어있지않다면, 서로 분리된 분리집합이라면 여행계획이 불가능하다.
for i in 0..<a.count {
    if i == 0 { root = find(a[i])}
    if root != find(a[i]) {
        isPossible = false
        break
    }
}
print(isPossible ? "YES" : "NO")
