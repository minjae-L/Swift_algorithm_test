import Foundation

// 테스트케이스 수
let T = Int(readLine()!)!

for _ in 0..<T {
    // 입력받기
    let input1 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input1[0], m = input1[1], t = input1[2]
    let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = input2[0], g = input2[1], h = input2[2]
    var graph = [Int: [(loc: Int, cost: Int)]]()
    var destination = [Int]()
    var answer = [Int]()
    var middleCost = 0
    
    // graph 저장
    for _ in 0..<m {
        let load = readLine()!.split(separator: " ").map{Int(String($0))!}
        // g-h거리 저장
        if (load[0] == g || load[1] == g) && (load[0] == h || load[1] == h) {
            middleCost = load[2]
        }
        if graph[load[0]] == nil {
            graph[load[0]] = [(loc: load[1], cost: load[2])]
        } else {
            graph[load[0]]?.append((loc: load[1], cost: load[2]))
        }
        if graph[load[1]] == nil {
            graph[load[1]] = [(loc: load[0], cost: load[2])]
        } else {
            graph[load[1]]?.append((loc: load[0], cost: load[2]))
        }
    }
    // 목적지 후보 저장
    for _ in 0..<t {
        destination.append(Int(readLine()!)!)
    }
    
    // minS: s지점에서 모든 점까지 최단거리
    // minG: g지점에서 모든 점까지 최단거리
    // minH: h지점에서 모든 점까지 최단거리
    var minS = dijkstra(s: s, n: n, graph: graph)
    var minG = dijkstra(s: g, n: n, graph: graph)
    var minH = dijkstra(s: h, n: n, graph: graph)
    
    // s: 시작점, m: 목적지
    // 두 경우의수 (s - g - h - m)의 최단거리 , (s - h - g - m)의 최단거리 가 (s - m)최단거리와 같다면 가능한 목적지
    for m in destination {
        let sumG = minS[g] + middleCost + minH[m]
        let sumH = minS[h] + middleCost + minG[m]
        
        if sumG == minS[m] || sumH == minS[m] {
            answer.append(m)
        }
    }
    // 오름차순으로 출력
    answer.sort{$0 < $1}
    print(answer.map{String($0)}.joined(separator: " "))
}

// 다익스트라
func dijkstra(s: Int, n: Int, graph: [Int: [(loc: Int, cost: Int)]]) -> [Int] {
    var needVisit = [(loc: s, cost: 0)]
    var idx = 0
    var min = Array(repeating: 2000000000, count: n+1)
    min[s] = 0
    
    while idx < needVisit.count {
        let node = needVisit[idx]
        idx += 1
        if graph[node.loc] == nil { continue }
        for i in graph[node.loc]! {
            let dist = i.cost
            if node.cost + dist < min[i.loc] {
                min[i.loc] = node.cost + dist
                needVisit.append((loc: i.loc, cost: min[i.loc]))
            }
        }
    }
    return min
}
