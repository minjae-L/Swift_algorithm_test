import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var N = input[0], K = input[1]
var queue = [(cur:N,cost: 0)]
var visited = Array(repeating: false, count: 100001)
visited[N] = true

while !queue.isEmpty {
    let node = queue.removeFirst()
    if node.cur == K {
        print(node.cost)
        break
    }
    if node.cur * 2 <= 100000 && !visited[node.cur * 2]{
        visited[node.cur*2] = true
        queue.append((cur: node.cur * 2, cost: node.cost))
    }
    if node.cur - 1 >= 0 && !visited[node.cur-1] {
        visited[node.cur-1] = true
        queue.append((cur: node.cur-1, cost: node.cost + 1))
    }
    if node.cur + 1 <= 100000 && !visited[node.cur+1] {
        visited[node.cur+1] = true
        queue.append((cur: node.cur+1, cost: node.cost + 1))
    }
    
}
