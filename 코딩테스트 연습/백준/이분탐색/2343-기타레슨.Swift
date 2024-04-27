import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var start = 1
var end = arr.reduce(0, +)

// 이분탐색
while start <= end {
    // 이분탐색의 중간값
    let mid = (start + end) / 2
    var sum = 0
    var count = 0
    var left = 0
    var pass = false
    
    // 블루레이에 강의를 최대한 담아본다.
    // 강의길이가 mid값보다 크다면 아에 담을 수 없으므로 이 길이는 사용할 수 없다 (더 길게해서 담아봐야함)
    while left < arr.count {
        sum += arr[left]
        if sum > mid {
            let num = sum - arr[left]
            if num != 0 && num <= mid {
                count += 1
            } else {
                pass = true
                break
            }
            sum = arr[left]
        }
        left += 1
    }
    // 최대한 담아보고 남은 강의가 있고, mid보다 작다면 블루레이에 담을 수 있으므로 +1
    // 남은 강의가 있지만 블루레이보다 크다면 담을 수 없다. pass = true
    if sum != 0 && sum <= mid {
        count += 1
    } else {
        pass = true
    }
    // 블루레이 크기가 너무작아 모든강의를 담을 수 없었다면 블루레이 크기를 늘린다.
    if pass {
        start = mid + 1
    } else {
        // 모든 강의를 담아봤지만 정한 갯수보다 작거나 같다면 갯수를 늘리기위해 블루레이 크기를 줄인다.
        // 모든 강의를 담아봤지만 정한 갯수보다 크다면 갯수를 줄이기위해 블루레이 크기를 늘린다.
        if count <= M {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
}
print(start)
