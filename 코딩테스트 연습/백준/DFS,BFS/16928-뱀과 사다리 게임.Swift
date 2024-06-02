import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = Array(repeating: 0, count: 101)
var answer = Int.max

// 사다리와 뱀 시작지점, 도착지점을 1차원배열로 저장
for i in 0..<N+M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]] = input[1]
}

var needVisit = [(cur: 1, cnt: 0)]
var idx = 0
var visited = Array(repeating: false, count: 101)
// BFS
// 현재지점부터 이동가능한 지점을 다음 탐색에 넣는다.
// visited를 통해 이미 도착했던 지점은 재방문을 하지 않는다.
// 사다리나 뱀을 모두 타고 도착지점을 다음 탐색에 넣는다.
while idx < needVisit.count {
    let node = needVisit[idx]
    // 도착지점에 도착한다면 횟수 출력
    if node.cur == 100 {
        answer = node.cnt
    }
    idx += 1
    for i in 1...6 {
        var arrived = node.cur + i
        if arrived > 100 { continue }
        let cnt = node.cnt
        if arr[arrived] != 0 {
            arrived = arr[arrived]
        }
        if !visited[arrived] {
            visited[arrived] = true
            needVisit.append((cur: arrived, cnt: cnt+1))
        }
    }
}

print(answer)
