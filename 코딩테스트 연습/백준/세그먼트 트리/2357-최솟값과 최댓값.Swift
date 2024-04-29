import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = [0]
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 구간최솟값 트리와 구간최댓값 트리 크기 할당
var minTree = Array(repeating: 0, count: arr.count * 4)
var maxTree = Array(repeating: 0, count: arr.count * 4)

// 구간최솟값 세그먼트 트리 생성함수
func sgMinInit(_ start: Int,_ end: Int,_ index: Int) -> Int{
    if start == end {
        minTree[index] = arr[start]
        return minTree[index]
    }
    let mid = (start+end)/2
    minTree[index] = min(sgMinInit(start, mid, index*2), sgMinInit(mid+1, end, index*2+1))
    return minTree[index]
}
// 구간최솟값 세그먼트 트리의 구간최솟값 구하기
func sgMin(_ start: Int,_ end: Int,_ index: Int,_ left: Int,_ right: Int) -> Int {
    if left > end || right < start { return Int.max }
    if left <= start && right >= end {
        return minTree[index]
    }
    let mid = (start+end)/2
    return min(sgMin(start, mid, index*2, left, right), sgMin(mid+1, end, index*2+1, left, right))
}
// 구간최댓값 세그먼트 트리 생성함수
func sgMaxInit(_ start: Int,_ end: Int,_ index: Int) -> Int{
    if start == end {
        maxTree[index] = arr[start]
        return maxTree[index]
    }
    let mid = (start+end)/2
    maxTree[index] = max(sgMaxInit(start, mid, index*2), sgMaxInit(mid+1, end, index*2+1))
    return maxTree[index]
}
// 구간최댓값 세그먼트 트리의 구간최댓값 구하기
func sgMax(_ start: Int,_ end: Int,_ index: Int,_ left: Int,_ right: Int) -> Int {
    if left > end || right < start { return Int.min }
    if left <= start && right >= end {
        return maxTree[index]
    }
    let mid = (start+end)/2
    return max(sgMax(start, mid, index*2, left, right), sgMax(mid+1, end, index*2+1, left, right))
}

// 두가지 세그먼트 트리 생성
sgMinInit(1, arr.count-1, 1)
sgMaxInit(1, arr.count-1, 1)

// 동작구현
for i in 0..<M {
    let range = readLine()!.split(separator: " ").map{Int(String($0))!}
    print("\(sgMin(1, arr.count-1, 1, range[0], range[1])) \(sgMax(1, arr.count-1, 1, range[0], range[1]))")
}
