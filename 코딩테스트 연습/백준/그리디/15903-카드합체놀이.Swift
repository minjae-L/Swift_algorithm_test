import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort{$0 < $1}

// 카드 합체
// 카드는 오름차순으로 정렬되어있기에, 0번째 원소와 1번째 원소가 가장 작은 수 2개이다.
for i in 0..<input[1] {
    var sum = arr[0] + arr[1]
    arr[0] = sum
    arr[1] = sum
    arr = arr.sorted{ $0 < $1}
}

print(arr.reduce(0, +))
