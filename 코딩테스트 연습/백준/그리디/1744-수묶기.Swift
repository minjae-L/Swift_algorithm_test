import Foundation

let count = Int(readLine()!)!
var arr1 = [Int]()
var arr2 = [Int]()
var arr = [Int]()
var sum = 0
var idx = 0
var zero = false

// 수열 입력받기
// 0은 존재하는지 bool 값으로 입력
// 음수와 양수 정렬을 위해 따로 저장
for i in 0..<count {
    let num = Int(readLine()!)!
    if num > 0 {
        arr1.append(num)
    } else if num < 0 {
        arr2.append(num)
    } else {
        zero = true
    }
}

// 양수는 내림차순으로 정렬
// 음수는 오름차순으로 정렬
// 정렬한 배열들을 합친다.
arr1.sort{ $0 > $1}
arr2.sort{ $0 < $1}
arr = arr2 + arr1

// 배열의 원소와 그 다음인덱스의 원소와 함께 비교한다.
// 원소 두개가 모두 음수라면 무조건 결합해서 양수로 만든다.
// 원소가 음수, 양수라면 0이 있다면 음수와 결합해 0으로 만들고 없다면 음수만 더한다.
// 원소가 둘다 양수라면 1이 존재하는지 파악후 존재한다면 결합하지 않는다.
// 원소가 마지막인덱스라면 그냥 더해준다.
while idx < arr.count {
    if idx + 1 < arr.endIndex {
        var num1 = arr[idx]
        var num2 = arr[idx+1]
        var comb = 0
        
        if num1 < 0 && num2 < 0 {
            comb = num1 * num2
            idx += 2
        } else if num1 < 0 && num2 > 0 {
            if zero {
                comb = 0
            } else {
                comb = num1
            }
            idx += 1
        } else {
            if num1 == 1 || num2 == 1 {
                comb = num1
                idx += 1
            } else {
                comb = num1 * num2
                idx += 2
            }
        }
        sum += comb
    } else {
        sum += arr[idx]
        idx += 1
    }
}

print(sum)
