import Foundation

// Union-Find
// 분리집합을 저장할 배열 parent
// parent[i] = a : i의 부모노드는 a다.
var parent = Array(repeating: 0, count: 7)

// 처음 초기화할땐 자기 자신을 루트노드로 갖는다.
for i in 1...6 {
    parent[i] = i
}

// 원소 x가 포함된 집합과 y가 포함된 집합을 합친다.
// 이때 합쳐진 집합의 루트노드는 x의 루트노드가 된다.
func union(_ x: Int, _ y: Int) {
    var rootX = find(x)
    var rootY = find(y)
    parent[rootY] = rootX
}
// 원소 x의 루트노드를 반환한다. (재귀호출)
// 재귀호출은 트리의 depth만큼 실행된다.
func find(_ x: Int) -> Int {
    if parent[x] == x { return x}
    parent[x] = find(parent[x])
    return parent[x]
}
