import Foundation

// 입력받기
let N = Int(readLine()!)!
let want = readLine()!.split(separator: " ").map{Int(String($0))!}
let money = Int(readLine()!)!
// start: 1, end는 지방중 예산이 가장필요로하는곳의 값
var sortedWants = want.sorted(by: <)
var start = 1
var end = sortedWants[sortedWants.endIndex - 1]
var result = 1

// 이분탐색
// 주어진 상한액(mid)로 모든 지방에 예산을 넣었다면, 상한액을 올려보고, 예산을 넣지 못했다면 상한액을 낮춰본다.
while start <= end {
    var count = 0
    var m = money
    var mid = (start + end) / 2
    for i in 0..<sortedWants.count {
        if m >= mid {
            if mid >= sortedWants[i] {
                m -= sortedWants[i]
                count += 1
            } else if mid < sortedWants[i] {
                m -= mid
                count += 1
            }
        }
    }
    if count == N {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
    
}

print(result)

