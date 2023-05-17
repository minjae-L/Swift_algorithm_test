import Foundation

let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [Int]()
var dp = Array(repeating: 0, count: inputs[1]+1)
for i in 0..<inputs[0] {
    arr.append(Int(readLine()!)!)
}
// 동전의 가치 오름차순으로 정렬
// 동전들로 0원을 만드는 경우의 수는 1가지 (동전을 쓰지않는방법)
arr.sort{ $0 < $1 }
dp[0] = 1

// k가치의 동전은 k보다 낮은가치를 만들 수 없다.
// 동전들마다 만들 수 있는 경우의 수를 dp에 저장한다.
// dp[n]: n원으로 만들 수 있는 경우의 수
for i in 0..<arr.count {
    for j in 0..<dp.count {
        if j-arr[i] >= 0 {
            if dp[j] + dp[j-arr[i]] >= Int(pow(2.0, 31.0)) {
                dp[j] = 0
            } else {
                dp[j] = dp[j] + dp[j-arr[i]]
            }
        }
    }
}

print(dp[inputs[1]])

