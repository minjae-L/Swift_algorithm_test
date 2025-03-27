import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var servers = Array(repeating: 0, count: players.count)
    var count = 0
    
    for i in 0..<players.count {
        let allowPlayerCount = (servers[i] * m) + m
        if players[i] >= allowPlayerCount {
            let needServerCount = abs(servers[i] - (players[i] / m))
            count += needServerCount
            for j in i..<i+k {
                if j >= players.count { continue }
                servers[j] += needServerCount
            }
        }
    }
    
    return count
}
