import Foundation

//입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1], M = input[2]
var list = readLine()!.split(separator: " ").map{Int(String($0))!}
list.insert(0, at: 0)
// dp[n][m]: n번째 곡을 m음량으로 연주할 수 있는지?
var dp = Array(repeating: Array(repeating: false, count: M+1), count: N+1)
dp[0][S] = true

// 연주할 수 있으면 true로 바꿔준다.
for i in 1...N {
    for j in 0...M {
        if dp[i-1][j] {
            let down = j - list[i]
            let up = j + list[i]
            if down >= 0 { dp[i][down] = true }
            if up <= M { dp[i][up] = true }
        }
    }
}

var answer = -1
for i in (0...M).reversed() {
    if dp[N][i] { answer = max(answer, i)}
}
print(answer)
