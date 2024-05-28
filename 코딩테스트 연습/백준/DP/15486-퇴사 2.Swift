import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+2)
// dp[n]: n일째에 최대로 받을 수 있는 급여
for i in 1...N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    // 상담이 퇴사전까지 가능하다면, 진행하고, 급여를 받는다.
    if i + input[0]-1 <= N {
        dp[i + input[0]-1] = max(dp[i + input[0]-1], dp[i-1] + input[1])
    }
    // 상담을 못한다면, 이전까지의 상담으로 얻은 급여를 저장
    dp[i] = max(dp[i], dp[i-1])
}
print(dp[N])
