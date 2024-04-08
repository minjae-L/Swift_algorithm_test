import Foundation

// 입력받기
let N = Int(readLine()!)!
var S = [[Int]]()
var answer = Int.max

// 인덱스 접근 편의상 [0] 공백을 추가했다.
S.append([0])
for i in 0..<N {
    S.append([0] + readLine()!.split(separator: " ").map{Int(String($0))!})
}

// dfs
func dfs(index: Int, team: [Int]) {
    // 팀이 꾸려지면 능력치 계산
    if team.count == N / 2 {
        calculate(arr: team)
    } else {
        // 팀 꾸리기
        for i in 1..<N {
            if index + i <= N {
                dfs(index: index+i, team: team + [index+i])
            }
        }
    }
}
// 능력치 계산
func calculate(arr: [Int]) {
    var start = arr
    var link = [Int]()
    var startSum = 0
    var linkSum = 0
    // 구해진팀과 다른 팀
    for i in 1...N {
        if !start.contains(i) {
            link.append(i)
        }
    }
    // 능력치를 모두 더해준다.
    for i in 0..<N/2 {
        for j in 0..<N/2 {
            startSum += S[start[i]][start[j]]
            linkSum += S[link[i]][link[j]]
        }
    }

    answer = min(answer, abs(startSum - linkSum))
}

for i in 1...N {
    dfs(index: i, team: [i])
}

print(answer)
