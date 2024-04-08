import Foundation

// 입력받기
let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var op = readLine()!.split(separator: " ").map{Int(String($0))!}
var maxNum = -1000000000
var minNum = 1000000000

// dfs
func dfs(num: Int, sum: Int) {
    if num == N-1 {
        maxNum = max(sum, maxNum)
        minNum = min(sum, minNum)
    } else {
        if op[0] > 0 {
            op[0] -= 1
            dfs(num: num+1, sum: sum + A[num+1])
            op[0] += 1
        }
        if op[1] > 0 {
            op[1] -= 1
            dfs(num: num+1, sum: sum - A[num+1])
            op[1] += 1
        }
        if op[2] > 0 {
            op[2] -= 1
            dfs(num: num+1, sum: sum * A[num+1])
            op[2] += 1
        }
        if op[3] > 0 {
            op[3] -= 1
            dfs(num: num+1, sum: sum / A[num+1])
            op[3] += 1
        }
    }
}

dfs(num: 0, sum: A[0])
print(maxNum)
print(minNum)
