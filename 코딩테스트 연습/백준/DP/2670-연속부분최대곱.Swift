import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr: [Double] = [0.0]
var dp = Array(repeating: 0.0, count: N+1)
var answer = 0.0
for i in 0..<N {
    arr.append(Double(readLine()!)!)
}

// 네번째 소수점자리 반올림
func multi(_ x: Double,_ y: Double) -> Double {
    let num = x * y
    let digit: Double = pow(10, 3)
    return round(num * digit) / digit
}
// dp[i]: i번까지의 최대값
for i in 1...N {
    dp[i] = max(arr[i], dp[i-1] * arr[i])
    answer = max(answer, dp[i])
}

print(String(format: "%.3f", multi(answer, 1.0)))
