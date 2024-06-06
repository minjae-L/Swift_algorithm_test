import Foundation

// 입력받기
let N = Int(readLine()!)!
var num = 4000000
var arr = Array(repeating: true, count: num+1)
var primeNums = [Int]()
let sqrtNum = Int(sqrt(Double(num)))
arr[1] = false
// 에라토스테네스의 체를 활용하여 소수 구하기
for i in 2...sqrtNum {
    if arr[i] == true {
        var j = 2
        while i * j <= num {
            arr[i * j] = false
            j += 1
        }
    }
}
// 구했던 소수를 배열에 저장
for i in 2...4000000 {
    if arr[i] {
        primeNums.append(i)
    }
}

var lidx = 0
var ridx = 0
var cnt = 0
var sum = primeNums[lidx]

// 투포인터 알고리즘
// 주어진 소수배열에서 왼쪽인덱스부터 오른쪽 인덱스까지의 합을 N과 비교한다.
// N이 된다면 cnt + 1 , N보다 작다면 오른쪽인덱스를 증가, N보다 크다면 왼쪽인덱스를 증가
// N이 작아서 오른쪽 인덱스를 늘려서 배열의 마지막인덱스를 초과한다면, 범위를 벗어난경우이고 왼쪽 인덱스를 올려도 합계 자체는 오르지 않기때문에 탈출
while lidx < primeNums.count && lidx <= ridx {
    if primeNums[lidx] > N { break }
    if sum == N {
        cnt += 1
        sum -= primeNums[lidx]
        lidx += 1
    } else if sum > N {
        sum -= primeNums[lidx]
        lidx += 1
    } else if sum < N {
        ridx += 1
        if ridx > primeNums.count - 1 {
            break
        }
        sum += primeNums[ridx]
    }
}

print(cnt)
