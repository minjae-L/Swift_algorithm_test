import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
// Union-Find
// 처음의 원소는 자기 자신을 루트노드로 갖는다.
// parent[x] = a: x의 부모노드는 a다.
var parent = Array(repeating: 0, count: n+1)
for i in 1...n {
    parent[i] = i
}
// 두개의 서로소집합을 합친다.
// 단순히 y의 루트노드가 x를 가리키면 된다.
// 이 문제에서는 연산의 크기가 크지않아서 따로 설정하지 않았지만, 이 알고리즘은 트리의 depth에 따라 연산속도가 달라진다.
// 그래서 합치는 과정에서 depth가 큰노드가 작은노드를 루트노드로 합치는 방향이 더 좋다.
func union(_ x: Int, _ y: Int) {
    var rootX = find(x)
    var rootY = find(y)
    parent[rootY] = rootX
}
// 해당 원소의 루트노드를 찾을때까지 재귀호출
func find(_ x: Int) -> Int {
    if parent[x] == x { return x}
    parent[x] = find(parent[x])
    return parent[x]
}
// 연산 실행
for i in 0..<m {
    let op = readLine()!.split(separator: " ").map{Int(String($0))!}
    // 합집합은 서로 합쳐준다.
    if op[0] == 0 {
        union(op[1], op[2])
    } else {
        // 두 원소가 같은 집합에 있다는것은 둘다 같은 루트노드를 가리킴을 의미한다.
        let p1 = find(op[1])
        let p2 = find(op[2])
        print(p1 == p2 ? "YES" : "NO")
    }
}
