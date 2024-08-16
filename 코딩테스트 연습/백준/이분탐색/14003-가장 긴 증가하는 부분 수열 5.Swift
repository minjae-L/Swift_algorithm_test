import Foundation

// 입력받기
let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}
A.insert(0, at: 0)
let INF = 1000000001
// 이분탐색 결과배열과 인덱스 배열
var result = Array(repeating: INF, count: N+1)
var idxArr = [Int]()
result[1] = A[1]

// 이분탐색
func binarySearch(num: Int) {
    var left = 1
    var right = result.count-1
    
    while left <= right {
        let mid = (right + left) / 2
        
        if result[mid] < num {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    // 해당위치에 넣고, 인덱스배열에 저장
    result[left] = num
    idxArr.append(left)
}

for i in 1...N {
    binarySearch(num: A[i])
}

var answer = [Int]()
var count = 0

// 부분수열의 길이 구하기
for i in 1...N {
    if result[i] != INF {
        count += 1
    } else {
        break
    }
}
// 부분수열 구하기
for i in (0..<idxArr.count).reversed() {
    if idxArr[i] == count {
        count -= 1
        answer.append(A[i+1])
    }
}
// 출력
print(answer.count)
print(answer.map{String($0)}.reversed().joined(separator: " "))
