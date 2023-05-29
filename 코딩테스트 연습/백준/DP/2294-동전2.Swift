import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [Int]()
var dp = Array(repeating: 0, count: input[1]+1)
dp[0] = 0

// n가지 동전의 종류를 배열로 입력
for i in 0..<input[0] {
    var num = Int(readLine()!)!
    arr.append(num)
}

// DP 입력
// dp[n] = n원을 만드는 최소 동전 개수
for i in 1...input[1] {
    var a = [Int]()
    // 해당 동전을 사용할 수 있는지 확인한다.
    // 주어진 동전들을 이용해서 만들수 있는지 확인: dp[i-arr[j]] != -1
    for j in 0..<arr.count {
        if i - arr[j] >= 0 && dp[i-arr[j]] != -1 {
            a.append(dp[i-arr[j]] + 1)
        }
    }
    // 만들 수 없다면 -1
    // 만들 수 있다면 만드는 경우의 수 중 최솟값을 저장
    if a.isEmpty {
        dp[i] = -1
    } else {
        dp[i] = a.min()!
    }
}
print(dp[input[1]])
