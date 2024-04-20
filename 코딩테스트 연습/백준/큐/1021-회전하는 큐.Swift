import Foundation
// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
let location = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(1...N)
var answer = 0

// 주어진 위치마다 최소연산 구하기
for i in location {
    var current = arr.first!
    var leftArr = arr
    var rightArr = arr
    var count = [Int]()
    var c = 0
  // 왼쪽으로만 돌렸을때
    while current != i {
        leftArr = swiftLeft(arr: &leftArr)
        current = leftArr.first!
        c += 1
    }
    count.append(c)
    c = 0
    current = rightArr.first!
    // 오른쪽으로만 돌렸을때
    while current != i {
        rightArr = swiftRight(arr: &rightArr)
        current = rightArr.first!
        c += 1
    }
    count.append(c)
    // 두개중 최솟값 저장
    if count[0] < count[1] {
        answer += count[0]
        arr = leftArr
        popFirst()
    } else {
        answer += count[1]
        arr = rightArr
        popFirst()
    }
    
}
print(answer)
func popFirst() {
    var a = Array(arr.reversed())
    a.removeLast()
    arr = a.reversed()
}

func swiftLeft(arr: inout [Int]) -> [Int] {
    var a = Array(arr.reversed())
    var num = a.removeLast()
    a = Array(a.reversed())
    a.append(num)
    arr = a
    
    return arr
}

func swiftRight(arr: inout [Int]) -> [Int] {
    var num = arr.removeLast()
    var a = Array(arr.reversed())
    a.append(num)
    arr = a.reversed()
    
    return arr
}

