import Foundation

// 입력받기
let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0
A.sort()

for i in 0..<N {
    var num = A[i]
    var start = 0
    var end = A.count - 1
    // 투포인터 알고리즘을 이용
    // 합산한 값이 작다면 start + 1
    // 합산한 값이 크다면 end - 1
    while start < end {
        if start == i {
            start += 1
            continue
        } else if end == i {
            end -= 1
            continue
        }
        let sum = A[start] + A[end]
        
        if sum == num {
            count += 1
            break
        }
        if sum > num {
            end -= 1
        } else {
            start += 1
        }
    }
    
}
print(count)
