import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2]

// 체스판의 맨 왼쪽상단이 검정색, 흰색인경우의 두가지 정상 체스판을 미리 만든다.
var black = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var white = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var first = false
var bl = true
var minSum = Int.max
for i in 1...N {
    if first {
        bl = true
    } else {
        bl = false
    }
    first = !first
    for j in 1...M {
        if bl {
            white[i][j] = 1
        } else {
            black[i][j] = 1
        }
        bl = !bl
    }
}

// 부분합 구하기
for i in 0..<N {
    let arr = Array(readLine()!)
    for j in 0..<arr.count {
        if (black[i+1][j+1] == 0 && arr[j] == "B") || (black[i+1][j+1] == 1 && arr[j] == "W") {
            black[i+1][j+1] = black[i+1][j] + 1 + black[i][j+1] - black[i][j]
        } else {
            black[i+1][j+1] = black[i+1][j] + black[i][j+1] - black[i][j]
        }
        if (white[i+1][j+1] == 0 && arr[j] == "B") || (white[i+1][j+1] == 1 && arr[j] == "W") {
            
            white[i+1][j+1] = white[i+1][j] + 1 + white[i][j+1] - white[i][j]
        } else {
            white[i+1][j+1] = white[i+1][j] + white[i][j+1] - white[i][j]
        }
    }
}

// 해당 부분합중 최솟값 구하기
for i in 1...N-K+1 {
    for j in 1...M-K+1 {
        let whiteSum = white[i+K-1][j+K-1] - white[i+K-1][j-1] - white[i-1][j+K-1] + white[i-1][j-1]
        let blackSum = black[i+K-1][j+K-1] - black[i+K-1][j-1] - black[i-1][j+K-1] + black[i-1][j-1]
        let m = min(whiteSum, blackSum)
        minSum = min(minSum, m)
    }
}
print(minSum)

