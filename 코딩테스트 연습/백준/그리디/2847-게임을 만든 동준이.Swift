import Foundation

let count = Int(readLine()!)!
var arr = [Int]()
var result = 0

// 레벨 점수 입력
for i in 0..<count {
    arr.append(Int(readLine()!)!)
}

// 마지막레벨부터 검사한다.
// 현재레벨이 이전레벨보다 점수가 낮거나 같으면 수정
// 이전레벨의 점수 = 현재레벨의 점수 - 1
// 점수감소횟수 = 이전레벨의 점수 - 현재레벨의 점수 + 1
for i in (1..<arr.count).reversed() {
    if arr[i] <= arr[i-1] {
        result += arr[i-1] - arr[i] + 1
        arr[i-1] = arr[i] - 1
    }
}

print(result)
