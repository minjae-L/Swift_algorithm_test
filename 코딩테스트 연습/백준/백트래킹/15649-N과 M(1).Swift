import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = Array(1...N)
var answer = ""

func dfs(_ count: Int,_ a: [Int]) {
    if count == M {
        answer += "\(a.map{String($0)}.joined(separator: " "))\n"
        return
    }
    for i in 0..<arr.count {
        if !a.contains(arr[i]) {
            dfs(count+1, a + [arr[i]])
        }
    }
}

dfs(0, [])
print(answer)
