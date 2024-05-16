import Foundation

//입력받기
let N = Int(readLine()!)!
var w = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!
var balls = readLine()!.split(separator: " ").map{Int(String($0))!}
// dp[n]: n무게 구슬을 측정할 수 있는지 판단
var dp = Array(repeating: false, count: 40001)
dp[0] = true
for i in 0..<N {
    // 현재까지 측정가능한 무게와, 그 다음 추를 이용해 측정 가능한 무게를 갱신
    // 더하면 for문이 계속 돌기때문에 역순으로 검사
    for j in (0...40000).reversed() {
        if dp[j] {
            dp[j + w[i]] = true
        }
    }
    // 빼기는 원래순서로
    for j in 0...40000 {
        if dp[j] {
            dp[abs(j - w[i])] = true
        }
    }
}

var answer = [String]()
for i in 0..<balls.count {
    if dp[balls[i]] {
        answer.append("Y")
    } else {
        answer.append("N")
    }
}
print(answer.joined(separator: " "))
