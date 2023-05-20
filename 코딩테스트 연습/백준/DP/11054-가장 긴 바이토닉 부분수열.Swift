import Foundation

let count = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: 0, count: count)
var rdp = Array(repeating: 0, count: count)

// 각 위치의 원소는 그 원소 하나 자체로 바이토닉 수열의 길이 1을 가진다.
// 인덱스 하나를 기준으로 이전 인덱스의 원소들을 모두 검사한다.
// 이전 원소보다 크고, 작은 원소가 중복되지않는 경우 1을 추가해준다.
for i in 0..<dp.count {
    dp[i] = 1
    for j in 0..<i {
        if arr[i] > arr[j] && dp[i] < dp[j] + 1 {
            dp[i] += 1
        }
    }
}

// 위 dp는 증가하는 수열의 길이를 구했다면, rdp는 감소하는 수열의 길이를 구하는것이다.
for i in (0..<rdp.count).reversed() {
    rdp[i] = 1
    for j in (i..<rdp.count).reversed() {
        if arr[i] > arr[j] && rdp[i] < rdp[j] + 1 {
            rdp[i] += 1
        }
    }
}

// 한 원소를 기준으로 했을때, dp rdp를 모두 구하고 더하면 기준이되는 원소가 중복으로 더해지므로 -1을 해준다.
for i in 0..<dp.count {
    dp[i] += rdp[i] - 1
}
print(dp.max()!)
