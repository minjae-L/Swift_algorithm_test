import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
let J = Int(readLine()!)!
var range = (left: 1, right: 1+M-1)
var count = 0

// 사과 갯수만큼 반복
for _ in 0..<J {
    // 사과가 해당 범위에 포함될 때 까지 이동
    let loc = Int(readLine()!)!
    while range.right < loc {
        range.right += 1
        range.left += 1
        count += 1
    }
    while range.left > loc {
        range.right -= 1
        range.left -= 1
        count += 1
    }
}

print(count)
