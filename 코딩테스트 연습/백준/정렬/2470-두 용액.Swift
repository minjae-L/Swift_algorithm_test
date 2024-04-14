import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = Int.max
var resultArr = [Int]()
var start = 0
var end = arr.count - 1
arr.sort(by: <)

// 왼쪽인덱스 start, 오른쪽인덱스 end가 서로 만날때 까지
while start < end {
    let leftNum = arr[start]
    let rightNum = arr[end]
    let sum = leftNum + rightNum
    
    // 더한값이 양수라면 오른쪽인덱스를 왼쪽으로 움직여 오른쪽 원소값을 더 작게만든다
    // 더한값이 음수라면 왼쪽인덱스를 오른쪽으로 움직여 왼쪽 원소값을 더 크게만든다.
    if sum > 0 {
        end -= 1
    } else if sum < 0 {
        start += 1
    } else {
        resultArr = [leftNum, rightNum]
        break
    }
    // 더한값의 절댓값이 이전에 구한 값보다 작아지면 갱신
    if abs(sum) < result {
        result = abs(sum)
        resultArr = [leftNum, rightNum]
    }
    
}
print(resultArr.map{String($0)}.joined(separator: " "))
