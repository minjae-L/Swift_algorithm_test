import Foundation

// 입력받기
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var minSum = Int.max
var answer = [Int]()

// 모든 용액 검사
for i in arr.indices {
    let num = arr[i]
    var start = i+1
    var end = N-1
    var sum = Int.max
    
    // 이분탐색으로 용액을 섞어본다.
    while start <= end {
        let mid = (start + end) / 2
        sum = num + arr[mid]
        // 합이 0이라면 바로 저장후 탈출
        if sum == 0 {
            minSum = abs(sum)
            answer = [num, arr[mid]]
            break
        }
        // 용액이 정렬되어 있기에 합이 음수면 더 큰값을 더해주고, 양수면 더 작은값을 더한다
        if sum < 0 {
            start = mid+1
        } else {
            end = mid-1
        }
        // 더한값이 최솟값인경우 계속 값을 갱신해준다.
        if minSum > abs(sum) {
            minSum = abs(sum)
            answer = [num, arr[mid]]
        }
    }
}

print("\(answer[0]) \(answer[1])")
