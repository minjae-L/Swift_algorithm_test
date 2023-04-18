import Foundation

var count = Int(String(readLine()!))!
var points = Array(repeating: 0, count: count+1)
var dp = Array(repeating: 0, count: count+1)

for i in 1...count {
    points[i] = Int(String(readLine()!))!
}

dp[1] = points[1]

if count == 1 {
    print(dp[1])
} else if count == 2 {
    dp[2] = max(points[1] + points[2], points[2])
    print(dp[2])
} else {
    dp[2] = max(points[1] + points[2], points[2])
    for i in 3...count {
        dp[i] = max(points[i-1] + dp[i-3], dp[i-2]) + points[i]
    }
    print(dp[count])
}


