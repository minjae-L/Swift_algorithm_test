import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var graph = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    var times = Array(repeating: Int.max, count: N+1)
    
    for i in 0..<road.count {
        let go = road[i][0]
        let stop = road[i][1]
        let time = road[i][2]
        
        if graph[go][stop] == 0 {
            graph[go][stop] = time
        } else {
            graph[go][stop] = min(graph[go][stop], time)
        }
        if graph[stop][go] == 0 {
            graph[stop][go] = time
        } else {
            graph[stop][go] = min(graph[stop][go], time)
        }
    }
    
    var queue = [(cur: Int,cost: Int)]()
    var visited = [Int]()
    times[1] = 0
    queue.append((cur:1,cost:0))
    
    while !queue.isEmpty {
        let town = queue.removeFirst()
        
        for i in 1...N {
            if graph[town.cur][i] != 0 && town.cost + graph[town.cur][i] < times[i] {
                times[i] = town.cost + graph[town.cur][i]
                queue.append((cur: i, cost: times[i]))
            }
        }
    }
    
    return times.filter{$0 <= k}.count
}
