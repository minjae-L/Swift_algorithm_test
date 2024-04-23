import Foundation

let T = Int(readLine()!)!

for i in 0..<T {
    let N = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map{Int(String($0))!}
    let money = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 10001)
    dp[0] = 1
    for j in coins {
        if j <= money {
            for k in j...money {
                dp[k] += dp[k - j]
            }
        }
    }
    print(dp[money])
}


