import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0

// 더하는 함수
func sum(index: Int, total: Int) {
    if total == M {
        count += 1
        return
    }
    if total > M {
        return
    }
    if index+1 < A.count {
        sum(index: index+1, total: total + A[index+1])
    } else {
        return
    }
}

for i in 0..<A.count {
    sum(index: i, total: A[i])
}
print(count)
