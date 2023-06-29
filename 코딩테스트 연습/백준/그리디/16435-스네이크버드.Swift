import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var fruits = readLine()!.split(separator: " ").map{ Int($0)! }
var len = input[1]

// 과일의 높이가 담긴 배열 내림차순 정렬
fruits.sort{ $0 > $1 }

// 과일먹기
// 해당높이가 스네이크버드의 길이보다 작거나 같으면 먹고 길이가 자란다.
while !fruits.isEmpty {
    let food = fruits.removeLast()
    if len >= food {
        len += 1
    } else {
        break
    }
}
print(len)
