import Foundation

var count = Int(readLine()!)!
var n = Int(readLine()!)!

// 배열을 입력받고, 오름차순으로 정렬
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort{ $0 < $1}

// 센서의 갯수가 1이거나 집중국의갯수와 같다면 최소합은 0이된다
// 센서사이의 거리를 구해 오름차순으로 정렬한 후 k-1개만큼 길이가 긴 범위를 빼준다.
if count == 1 || count == n {
    print(0)
} else {
    var sub = [Int]()
    for i in 0..<arr.count-1 {
        sub.append(arr[i+1] - arr[i])
    }
    sub.sort{ $0 < $1}
    for i in 0..<n-1 {
        sub.removeLast()
    }
    print(sub.reduce(0, +))
}
