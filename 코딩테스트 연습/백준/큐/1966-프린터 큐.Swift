import Foundation

// 입력받기
let T = Int(readLine()!)!

for i in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0], M = input[1]
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var queue = [(idx: Int, ipt: Int)]()
    var count = 0
    for j in 0..<arr.count {
        queue.append((idx: j, ipt: arr[j]))
    }
    // 궁금한 문서 뽑을때까지 반복
    while true {
        if isImportant(queue) {
            count += 1
            if pop(&queue).idx == M { break }
        } else {
            moveBack(&queue)
        }
    }
    print(count)
}

// 첫번째원소가 중요도가 가장 높은지 파악
func isImportant(_ queue: [(idx: Int, ipt: Int)]) -> Bool {
    guard let top = top(queue) else { return false }
    var max = Int.min
    for i in queue {
        if i.ipt > max { max = i.ipt }
    }
    if max == top.ipt { return true } else { return false }
}
// 첫번째 원소 출력
func top(_ queue: [(idx: Int, ipt: Int)]) -> (idx: Int, ipt: Int)? {
    if queue.isEmpty { return nil }
    return queue[0]
}
// 첫번째 원소 Pop
func pop(_ queue: inout [(idx: Int, ipt: Int)]) -> (idx: Int, ipt: Int) {
    var a = Array(queue.reversed())
    let num = a.removeLast()
    queue = Array(a.reversed())
    return num
}
// 첫번째 원소 뒤로 이동
func moveBack(_ queue: inout [(idx: Int, ipt: Int)]) {
    let num = pop(&queue)
    queue.append(num)
}
