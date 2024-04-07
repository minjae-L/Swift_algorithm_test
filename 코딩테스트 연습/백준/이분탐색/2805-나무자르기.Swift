import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let trees = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var result = 0

// 이분탐색의 left,rigt 인덱스
var start = 0
var end = trees.max()!

// 이분탐색
// 자른값이 구하려는 값보다 작다면 높이를 낮게설정(더많이 잘린다.)
// 자른값이 구하려는 값보다 크다면 높이를 높게설정(더적게 잘린다.)
while start <= end {
    let mid = (start + end) / 2
    var count = 0
    
    for i in 0..<trees.count {
        if mid < trees[i] {
            count += trees[i] - mid
        }
    }
    if count >= M {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(result)
