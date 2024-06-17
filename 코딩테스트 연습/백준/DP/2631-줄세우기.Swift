import Foundation

// 입력받기
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)
var arr = [Int]()
arr.append(0)
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 증가하는 부분수열의 길이 구하기
// 증가하는 부분수열이 존재하면 해당 수열을 기준으로 아이들을 옮기는게 최소방법이다.
for i in 1...N {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(N - dp.max()!)
