import Foundation
// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let C = input[1]
var arr = [Int]()
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}
// 집좌표 오름차순 정렬
arr.sort(by: <)
// 집과 집사이의 공유기 설치거리 최솟값과 최댓값
// 최솟값은 집집마다 공유기 설치한다면 0, 최댓값은 정렬된 집좌표에서 첫번째집과 마지막번째 집사이의 거리가된다.
var startIndex = 0
var endIndex = arr[arr.endIndex - 1] - 0
var result = 0  // 결과를 저장할 변수

// 이분탐색
while startIndex <= endIndex {
    var count = 1
    var house = arr[0]
    let midIndex = (endIndex + startIndex) / 2
    // 첫번째 집부터 공유기를 설치해보고, 다음집까지 설치거리가 닿는다면 패스
    // 닿지 않으면 공유기를 새로 설치해야하므로 count ++ 하고, 기준이 되는 집 갱신한다.
    for i in 0..<N {
        let nextHouse = arr[i]
        if midIndex <= nextHouse - house {
            count += 1
            house = nextHouse
        }
    }
    // 공유기가 더 많이 설치가 됬다면, 설치거리가 짧아서 많은 집들에 설치가된것으로, 설치거리를 늘린다.
    // 공유기가 더 적게 설치가 됬다면, 설치거리가 길어서 한 집이 많은 집을 커버했다. 설치거리를 줄인다.
    // 이렇게 반복하면 설치거리가 최대가 될때까지 반복이 된다.
    if count >= C {
        result = midIndex
        startIndex = midIndex + 1
    } else {
        endIndex = midIndex - 1
    }
}

print(result)
