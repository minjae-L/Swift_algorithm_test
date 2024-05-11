import Foundation
var fiboCount = 0
var dpCount = 0
var dp = Array(repeating: 0, count: 50)
dp[1] = 1
dp[2] = 1

func fib(_ n: Int) -> Int{
    if n == 1 || n == 2 {
        fiboCount += 1
        return 1
    }
    return fib(n-1) + fib(n-2)
}

func fibonacci(_ n: Int) -> Int {
    if n < 3 { return dp[n] }
    for i in 3...n {
        dpCount += 1
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

let n = Int(readLine()!)!
fibonacci(n)

print("\(dp[n]) \(dpCount)")
