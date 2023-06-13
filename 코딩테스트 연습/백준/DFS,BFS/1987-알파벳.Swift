import Foundation

// 비트마스킹 기억해두자.
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let r = input[0]
let c = input[1]
var arr = [[Int]]()
var result = 0
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

// 알파벳 비트마스킹
for i in 0..<r {
    arr.append(readLine()!.map{ Int($0.asciiValue!) - 65 })
}

// DFS 백트래킹
func dfs(x: Int, y: Int, count: Int, alphabet: Int) {
    result = max(result, count)

    for i in 0..<4 {
        let mx = dx[i] + x
        let my = dy[i] + y

        if (mx >= 0 && mx < r) && (my >= 0 && my < c) && (alphabet & 1 << arr[mx][my] == 0) {
            dfs(x: mx, y: my, count: count+1, alphabet: alphabet | 1 << arr[mx][my])
            
        }
    }

}

dfs(x: 0, y: 0, count: 1, alphabet: 1 << arr[0][0])
print(result)

