import Foundation

var g = Int(readLine()!)!
var p = Int(readLine()!)!
var arr = Array(1...g)
arr.insert(0, at: 0)
var result = 0

// Union-find 의 find
func find(_ x: Int) -> Int {
    if arr[x] == x { return x}
    arr[x] = find(arr[x])
    return arr[x]
}
// Union-find 의 union
func union(x: Int, y: Int) {
    arr[find(y)] = find(x)
}

for i in 0..<p {
    var num = Int(readLine()!)!
    // 해당 비행기가 도킹할 수 있는지?
    // 도킹했다면 union을 통해 배열 최신화
    if find(num) == 0 { break }
    result += 1
    union(x: find(num) - 1, y: find(num))
}
print(result)

