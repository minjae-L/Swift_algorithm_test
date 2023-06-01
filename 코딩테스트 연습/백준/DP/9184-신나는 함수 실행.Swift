import Foundation

var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 21), count: 21), count: 21)

func w(_ a: Int,_ b: Int,_ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    }
    if dp[a][b][c] != -1 {
        return dp[a][b][c]
    }
    if a < b && b < c {
        dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
        return dp[a][b][c]
    } else {
        dp[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
        return dp[a][b][c]
    }
}


while true {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if input[0] == -1 && input[1] == -1 && input[2] == -1 {
        break
    }
    print("w(\(input[0]), \(input[1]), \(input[2])) = \(w(input[0], input[1], input[2]))")
}
