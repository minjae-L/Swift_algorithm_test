import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var needVisitedQueue = [input[0]]
var idx = 0
var arr = [Int]()
var dp = Array(repeating: 0, count: 100001)
var visited = Array(repeating: 0, count: 100001)
visited[input[0]] = 1
// 소요시간을 저장할 배열 DP
// 해당 지점을 방문했는지 확인하기위한 배열 visited (visited[n] == 1 이면 지점 N은 이미 방문했다.)
// BFS로 시작점에서 인접한 노드순으로 탐색한다.
while idx < needVisitedQueue.count {
    var node = needVisitedQueue[idx]
    idx += 1
    if node == input[1] { break }
    
    // 해당 노드의 인접노드들이 범위안에 있고, 방문하지 않은곳이라면 다음방문 순서로 둔다.
    if node-1 >= 0 && visited[node-1] != 1 {
        needVisitedQueue.append(node-1)
        visited[node-1] = 1
        dp[node-1] = dp[node] + 1
    }
    if node+1 <= 100000 && visited[node+1] != 1 {
        needVisitedQueue.append(node+1)
        visited[node+1] = 1
        dp[node+1] = dp[node] + 1
    }
    if node*2 <= 100000 && visited[node*2] != 1 {
        needVisitedQueue.append(node*2)
        visited[node*2] = 1
        dp[node*2] = dp[node] + 1
    }
}

print(dp[input[1]])
