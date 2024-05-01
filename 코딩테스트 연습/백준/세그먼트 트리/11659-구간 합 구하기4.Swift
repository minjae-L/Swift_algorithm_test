import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.insert(0, at: 0)
var tree = Array(repeating: 0, count: arr.count*4)

// 세그먼트 트리 생성함수
func sgInit(_ start: Int,_ end: Int,_ index: Int) -> Int {
    if start == end {
        tree[index] = arr[start]
        return tree[index]
    }
    let mid = (start+end)/2
    tree[index] = sgInit(start, mid, index*2) + sgInit(mid+1, end, index*2+1)
    return tree[index]
}
// 세그먼트 트리생성
sgInit(1, arr.count-1, 1)

// 세그먼트 트리의 구간합 구하기
func sgSum(_ start: Int,_ end: Int,_ index: Int,_ left: Int,_ right: Int) -> Int {
    if left > end || right < start { return 0 }
    if start >= left && end <= right { return tree[index] }
    let mid = (start+end)/2
    
    return sgSum(start, mid, index*2, left, right) + sgSum(mid+1, end, index*2+1, left, right)
}

// 구간합 출력
for i in 0..<M {
    let range = readLine()!.split(separator: " ").map{Int(String($0))!}
    print(sgSum(1, arr.count-1, 1, range[0], range[1]))
}
