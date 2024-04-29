import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2]
var arr = [0]
for i in 0..<N {
    arr.append(Int(readLine()!)!)

}
// 세그먼트 트리 크기지정
var tree = Array(repeating: 0, count: arr.count * 4)

// 세그먼트 트리 생성함수
func sgInit(_ start: Int,_ end: Int,_ index: Int) -> Int{
    if start == end {
        tree[index] = arr[start]
        return tree[index]
    }
    let mid = (start + end)/2
    tree[index] = sgInit(start, mid, index*2) &+ sgInit(mid+1, end, index*2+1)
    
    return tree[index]
}
// 세그먼트트리를 이용한 구간합 구하기
func sgSum(_ start: Int,_ end: Int,_ index: Int,_ left: Int,_ right: Int) -> Int {
    if left > end || right < start { return 0 }
    if start >= left && end <= right {
        return tree[index]
    }
    let mid = (start+end)/2
    return sgSum(start, mid, index*2, left, right) &+ sgSum(mid+1, end, index*2+1, left, right)
}
// 원소값 변경으로 세그먼트트리의 값 수정
func sgUpdate(_ start: Int,_ end: Int,_ index: Int,_ node: Int,_ value: Int) {
    if start > node || end < node { return }
    tree[index] += value
    if start == end { return }
    let mid = (start+end)/2
    sgUpdate(start, mid, index*2, node, value)
    sgUpdate(mid+1, end, index*2+1, node, value)

}
// 세그먼트 트리 만들기
sgInit(1, arr.count-1, 1)

// 동작 수행
for i in 0..<M+K {
    let op = readLine()!.split(separator: " ").map{Int(String($0))!}
    if op[0] == 1 {
        // 세그먼트 트리의 값 수정해주고, 배열값도 수정해준다.
        sgUpdate(1, arr.count-1, 1, op[1], op[2] - arr[op[1]])
        arr[op[1]] = op[2]
    } else if op[0] == 2 {
        print(sgSum(1, arr.count-1, 1, op[1], op[2]))
    }
}
