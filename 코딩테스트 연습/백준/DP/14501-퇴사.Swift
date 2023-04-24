import Foundation

let count = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: count+1)
var pays = [Int]()
var times = [Int]()

for i in 0..<count {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    times.append(inputs[0])
    pays.append(inputs[1])
}

for i in stride(from: count-1, to: -1, by: -1) {
    if times[i] + i > count {
        dp[i] = dp[i+1]
    } else {
        dp[i] = max(dp[i+1], pays[i] + dp[i+times[i]])
    }
}
print(dp.max()!)


