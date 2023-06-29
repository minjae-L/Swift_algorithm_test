import Foundation

// 입력
let input = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }

// r: 결과배열, dp: 가장 긴 부분수열을 저장할 배열
var r = [Int]()
var dp = Array(repeating: [Int](), count: input)

// 수열의 각 원소는 최소 자신만 갖는 부분수열로 길이가 1이다.
// 현재원소가 이전원소보다 크다면 이전원소의 dp에 저장된 배열 + 현재원소를 저장하여 최신화
for i in 0..<arr.count {
    dp[i] = [arr[i]]
    for j in 0..<i {
        if arr[i] > arr[j] {
            var a = dp[j]
            a.append(arr[i])
            if a.count > dp[i].count {
                dp[i] = a
            }
        }
    }
    // 가장 긴 부분수열 최신화
    if dp[i].count > r.count {
        r = dp[i]
    }
}

print(r.count)
print(r.map{String($0)}.joined(separator: " "))
