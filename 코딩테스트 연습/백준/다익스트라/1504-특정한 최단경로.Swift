import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], E = input[1]
var graph = [Int: [(num: Int, cost: Int)]]()
for i in 0..<E {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    if graph[line[0]] == nil {
        graph[line[0]] = [(num: line[1], cost: line[2])]
    } else {
        graph[line[0]]!.append((num: line[1], cost: line[2]))
    }
    if graph[line[1]] == nil {
        graph[line[1]] = [(num: line[0], cost: line[2])]
    } else {
        graph[line[1]]!.append((num: line[0], cost: line[2]))
    }
}

var node = readLine()!.split(separator: " ").map{Int(String($0))!}
var md = Array(repeating: 1000000, count: 801)
var queue = [(num: 1, cost: 0)]
var fSum = 0
var sSum = 0
var can = true
var first = [1, node[0], node[1], N]
var second = [1, node[1], node[0], N]
for i in 0..<3 {
    md = Array(repeating: 1000000, count: 801)
    md[first[i]] = 0
    queue = [(num: first[i], cost: 0)]
    while !queue.isEmpty {
        let n = queue.removeLast()
        let next = graph[n.num]
        if next == nil { continue }
        if n.num == first[i+1] {
            break
        }
        for i in next! {
            if md[i.num] > md[n.num] + i.cost {
                md[i.num] = md[n.num] + i.cost
                queue.append((num: i.num, cost: md[i.num]))
            }
        }
        queue.sort{$0.cost > $1.cost}
    }

    if md[first[i+1]] == 1000000 {
        can = false
    } else {
        fSum += md[first[i+1]]
    }
}
can = true
for i in 0..<3 {
    md = Array(repeating: 1000000, count: 801)
    md[second[i]] = 0
    queue = [(num: second[i], cost: 0)]
    while !queue.isEmpty {
        let n = queue.removeLast()
        let next = graph[n.num]
        if next == nil { continue }
        if n.num == second[i+1] {
            break
        }
        for i in next! {
            if md[i.num] > md[n.num] + i.cost {
                md[i.num] = md[n.num] + i.cost
                queue.append((num: i.num, cost: md[i.num]))
            }
        }
        queue.sort{$0.cost > $1.cost}
    }

    if md[second[i+1]] == 1000000 {
        can = false
    } else {
        sSum += md[second[i+1]]
    }
}
if can {
    print(min(fSum, sSum))
} else {
    print(-1)
}
