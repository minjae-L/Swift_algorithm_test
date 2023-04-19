import Foundation

let count = Int(String(readLine()!))!

for i in 0..<count {
    let num = Int(String(readLine()!))!
    var dp = Array(repeating: 0, count: num+1)
    
    if num <= 3 {
        dp[num] = 1
        print(dp[num])
    } else {
        for i in 1...num {
            if i <= 3 {
                dp[i] = 1
                continue
            }
            dp[i] = dp[i-2] + dp[i-3]
        }
        print(dp[num])
    }

}
