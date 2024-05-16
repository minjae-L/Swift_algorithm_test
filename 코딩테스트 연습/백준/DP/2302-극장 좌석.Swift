import Foundation

//입력받기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var vip = [Int]()
for i in 0..<M {
    vip.append(Int(readLine()!)!)
}
// dp[n]: 중간 vip좌석 없이 n번째까지의 배치 경우의 수
var dp = Array(repeating: 1, count: N+1)
// vip좌석을 만나면 값을 저장할 변수
var mul = 1
var idx = 0
var vp = false

// 탐색
for i in 1...N {
    // vip좌석을 만나면 중간값 저장
    if idx < M && i == vip[idx] {
        idx += 1
        dp[i] = 1
        mul = dp[i-1] * mul
        vp = true
        continue
    }
    // 이전에 vip좌석이였다면 그 다음 배치경우의수는 좌석 1개이므로 1
    if vp {
        dp[i] = 1
        vp = false
        continue
    }
    // 첫번째 좌석은 경우의수가 1가지
    if i == 1 {
        dp[i] = 1
        continue
    }
    dp[i] = dp[i-1] + dp[i-2]
}
print(dp[N] * mul)
