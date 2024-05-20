import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], D = input[1]
var dp = Array(0...D)
var routes = [(start: Int, end: Int, dist: Int)]()
for i in 0..<N {
    let road = readLine()!.split(separator: " ").map{Int(String($0))!}
    routes.append((start:road[0], end: road[1], dist: road[2]))
}
routes.sort{ $0.start <= $1.start}

// dp[n]: n길이의 고속도로 최소 운전거리
// 기본적으로 150길이의 고속도로는 150만큼 운전해야한다. dp[n] = dp[n-1] + 1
// 해당위치가 지름길의 도착점이라면, 지름길의 길이가 기본운전한것보다 길이가 짧다면 대입하여 최솟값을 갱신한다.
for i in 0...D {
    let filtered = routes.filter{$0.end == i}
    if !filtered.isEmpty {
        for road in filtered {
            dp[i] = min(dp[i], dp[road.start] + road.dist)
        }
    }
    if i == 0 {
        dp[i] = 0
    } else {
        dp[i] = min(dp[i], dp[i-1] + 1)
    }
}
print(dp[D])
