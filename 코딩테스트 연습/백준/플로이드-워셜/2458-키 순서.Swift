import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var graph = Array(repeating: Array(repeating: false, count: N+1), count: N+1)
var answer = 0

// 그래프 입력
for i in 0..<M {
    let cp = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[cp[0]][cp[1]] = true
}
// 플로이드-워셜
// 단순히 자신보다 크거나 작은 인원이 있는지만 알기 위해 Bool값 이용(정수 이용하면 시간이 너무 오래걸린다.)
for m in 1...N {
    for i in 1...N {
        for j in 1...N {
            if graph[i][m] && graph[m][j] { graph[i][j] = true }
        }
    }
}

// 해당 번호보다 (더작은인원 + 더큰인원 = 본인제외한 인원수) 라면 순서를 알 수 있다.
for i in 1...N {
    var tall = 0
    var short = 0
    for j in 1...N {
        if i == j { continue }
        if graph[i][j] { tall += 1 }
        if graph[j][i] { short += 1 }
    }
    if tall+short == N-1 {
        answer += 1
    }
}

print(answer)
