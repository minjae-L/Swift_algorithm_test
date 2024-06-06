import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], C = input[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var left = [Int]()
var right = [Int]()
var leftSums = [Int]()
var rightSums = [Int]()
var answer = 0
let mid = arr.count / 2

// 주어진 물건의 배열을 절반으로 나눈다.
for i in 0..<mid {
    left.append(arr[i])
}
for i in mid..<arr.count {
    right.append(arr[i])
}

// 조합
// 조합을 이용해 배열내 모든원소의 합 부분집합을 구한다.
func combi(targetArr: [Int], targetNum: Int, sum: Int, cnt: Int, index: Int, right: Bool) {
    if targetNum == cnt {
        if right {
            rightSums.append(sum)
        } else {
            leftSums.append(sum)
        }
        return
    }
    for i in index..<targetArr.count {
        let total = sum + targetArr[i]
        if total <= C {
            combi(targetArr: targetArr, targetNum: targetNum, sum: total, cnt: cnt+1, index: i+1, right: right)
        }
    }
}

// 반으로 나눈 배열의 각 부분집합을 조합을 이용해 구한다.
// 오른쪽 배열
for i in 0...right.count {
    combi(targetArr: right, targetNum: i, sum: 0, cnt: 0, index: 0, right: true)
}
// 왼쪽 배열
for i in 0...left.count {
    combi(targetArr: left, targetNum: i, sum: 0, cnt: 0, index: 0, right: false)
}

// 이분탐색을 위해 정렬
leftSums.sort{$0 < $1}
rightSums.sort{$0 < $1}

// 이분탐색
// 부분집합의 합이 무게 C보다 작아야한다.
// 이는 오른쪽 부분집합 원소 하나를 꺼낸 값이 (C - 왼쪽부분집합의 값) 보다 작거나 같다면 가능한 경우의 수다.
// 이분탐색을 이용해 가능한 경우의수중 가장 큰수의 인덱스를 구한다.
// 여기서 인덱스는 곧 해당 원소보다 작거나 같은 원소의 갯수를 의미하므로 해당 인덱스를 더해준다.
// 중복된 값이 존재하는 이분탐색은 가장 뒤쪽의 인덱스를 구하는방법을 사용하자.
for rNum in rightSums {
    let sub = C - rNum
    var lidx = 0
    var ridx = leftSums.count - 1
    while lidx <= ridx {
        let mid = (lidx + ridx) / 2
        if leftSums[mid] <= sub {
            lidx = mid + 1
        }else {
            ridx = mid - 1
        }
    }
    answer += ridx+1
}

print(answer)
