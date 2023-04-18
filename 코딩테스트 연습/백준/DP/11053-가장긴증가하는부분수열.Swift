import Foundation

var count = Int(String(readLine()!))!
var arr = [0] + readLine()!.split(separator: " ").map{ Int(String($0))!}
var dp = Array(repeating: 0, count: count+1)

dp[1] = 1
if count == 1 {
    print(dp[1])
} else {
    for i in 2...count {
        var check = [Int]()
        for j in 1..<i {
            if arr[i] > arr[j] {
                check.append(dp[j])
            }
        }
        if check.isEmpty {
            dp[i] += 1
        } else {
            dp[i] = check.max()! + 1
        }
    }
    print(dp.max()!)
}

