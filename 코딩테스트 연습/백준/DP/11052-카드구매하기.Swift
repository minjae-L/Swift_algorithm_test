import Foundation

let num = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: num+1)
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
arr.insert(0, at: 0)
dp[1] = arr[1]

if num > 1 {
    for i in 2...num {  //dp값 입력
        var max = 0
        for j in 1...i {//      N개가 들어있는 PN을 구매할때 비용의 최댓값: PN + dp[n-n] = PN
            let price = arr[j] + dp[i-j]
            if price > max {
                max = price
            }
        }
        dp[i] = max
    }
    print(dp[num])
} else {
    print(dp[1])
}

