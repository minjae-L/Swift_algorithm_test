import Foundation

let count = Int(String(readLine()!))!
var distance = readLine()!.split(separator: " ").map{ Int(String($0))! }
var price = readLine()!.split(separator: " ").map{ Int(String($0))! }
var sum = price[0] * distance[0]
var idx = 0
var minPrice = price[0]

if count == 2 { // 도시가 두개인경우 한번 이동하므로 첫번째 주유한값 출력
    print(sum)
} else {
    for i in 1..<distance.count {
        if minPrice > price[i] {    // 이전 거쳐왔던 도시들 중 가장 낮은 주유비용이 도착한 도시의 주유비용보다 큰경우 갱신
            minPrice = price[i]
        }
        sum = sum + (minPrice * distance[i])    // 그다음 도시까지 거리를 계산한 값을 저장한다.
    }
    print(sum)
}


