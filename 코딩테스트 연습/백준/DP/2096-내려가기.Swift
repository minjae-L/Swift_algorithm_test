import Foundation

let count = Int(readLine()!)!
var maxDp = Array(repeating: 0, count: 3)
var minDp = Array(repeating: 0, count: 3)

// DP 입력
// 이전의 값과 새로 추가되는 원소와 더해서 최대값 최소값을 넣는다.
for i in 0..<count {
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    if i == 0 {
        maxDp = arr
        minDp = arr
        continue
    }
    let dp1 = maxDp
    let dp2 = minDp
    maxDp[0] = max(arr[0] + dp1[0], arr[0] + dp1[1])
    maxDp[1] = max(arr[1] + dp1[0], arr[1] + dp1[1], arr[1] + dp1[2])
    maxDp[2] = max(arr[2] + dp1[1], arr[2] + dp1[2])
    
    minDp[0] = min(arr[0] + dp2[0], arr[0] + dp2[1])
    minDp[1] = min(arr[1] + dp2[0], arr[1] + dp2[1], arr[1] + dp2[2])
    minDp[2] = min(arr[2] + dp2[1], arr[2] + dp2[2])

}

print("\(maxDp.max()!) \(minDp.min()!)")

 
