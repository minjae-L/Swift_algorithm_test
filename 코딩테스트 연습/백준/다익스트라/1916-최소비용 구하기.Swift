import Foundation

// 입력받기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var cities = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
var bus = [[Int]]()
for i in 0..<M {
    let b = readLine()!.split(separator: " ").map{Int(String($0))!}
    bus.append(b)
}
let direct = readLine()!.split(separator: " ").map{Int(String($0))!}

// 2차원 배열로 만들기 cities[i][j] : i도시에서 j도시로 가는 거리
// 출발지와 목적지가 동일한 버스가 주어진다면 값비교해서 최솟값만 넣기
for i in bus {
    if cities[i[0]][i[1]] == Int.max {
        cities[i[0]][i[1]] = i[2]
    } else {
        if cities[i[0]][i[1]] > i[2] {
            cities[i[0]][i[1]] = i[2]
        }
    }
    
}
// 최단경로를 저장해놓을 배열
var md = Array(repeating: Int.max, count: N+1)
md[direct[0]] = 0
var queue = [(cur: direct[0], cost: 0)]

// 탐색
while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in 1...N {
        // 현재 도시와 인접도시가 버스를 통해 갈 수 있고, 저장된 최단거리보다 더 짧다면 갱신해주고, 큐에 삽입
        if cities[node.cur][i] != Int.max && md[node.cur] + cities[node.cur][i] < md[i] {
            md[i] = md[node.cur] + cities[node.cur][i]
            queue.append((cur: i, cost: md[i]))
        }
    }
}
print(md[direct[1]])
