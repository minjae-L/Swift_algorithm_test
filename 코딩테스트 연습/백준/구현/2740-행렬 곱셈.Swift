import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr1 = [[Int]]()
var arr2 = [[Int]]()

for i in 0..<N {
    arr1.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

input = readLine()!.split(separator: " ").map{Int(String($0))!}
let K = input[1]

for i in 0..<M {
    arr2.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var result = Array(repeating: Array(repeating: 0, count: K), count: N)

func multi() {
    for i in 0..<N {
        for j in 0..<K {
            result[i][j] = sum(j, i)
        }
    }
}
func sum(_ x: Int,_ y: Int) -> Int{
    var sum = 0
    for i in 0..<M {
        sum += (arr1[y][i] * arr2[i][x])
    }
    return sum
}
multi()

for i in 0..<result.count {
    print(result[i].map{String($0)}.joined(separator: " "))
}
