import Foundation

//입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let X = input[0], Y = input[1]
let Z = Y * 100 / X

// result = -1 (한판도 하지않는경우와 승률이 변하지않는경우)
// startIndex: 0, endIndex: X
var result = -1
var start = 0
var end = X

// 이분탐색
while start <= end {
    let mid = (start + end) / 2
    let newX = X + mid
    let newY = Y + mid
    let newZ = 100 * newY / newX
    // 승을 더해서 계산한 승률이 이전승률과 같다면, 승수를 늘려서 승률을 다르게 만든다.
    // 승을 더해서 계산한 승률이 이전승률과 다르다면, 승수를 줄여서 최솟값을 구한다
    if newZ == Z {
        start = mid + 1
    } else {
        result = mid
        end = mid - 1
    }
}
print(result)
