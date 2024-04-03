import Foundation

// Deque
struct Deque<T> {
    var enqueue: [T]
    var dequeue: [T] = []

    init(enqueue: [T]) {
        self.enqueue = enqueue
    }
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }

    mutating func first() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.last
    }
    mutating func pushFront(_ element: T) {
        dequeue.append(element)
    }
    mutating func pushRear(_ element: T) {
        enqueue.append(element)
    }
    mutating func popFront() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    mutating func popRear() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()
    }
}
// 입력
let N = Int(readLine()!)!
let booms = readLine()!.split(separator: " ").map{Int(String($0))!}
// Deque에 입력받은 정수 크기의 배열 넣는다
var dq = Deque(enqueue: Array(1...N))
// 결과를 저장할 배열
var result = [Int]()

// 처음에 첫번째 풍선을 터트리고 해당 인덱스에 있는 요소만큼 이동하여 다음 풍선을 터트린다.
// 인덱스를 사용하여 풍선을 터트릴 수 있지만, Deque 성질을 활용한다.
// 오른쪽으로(양수) 이동한다는 것은 가장 왼쪽 원소를 떼서 오른쪽으로 붙여넣는것이랑 같다.
// 반대로 왼쪽으로(음수) 이동한다는 것은 가장 오른쪽 원소를 떼서 왼쪽으로 붙여넣는것이랑 같다.
// push(pop)을 움직여야할 수만큼 움직였다면, 가장 왼쪽에는 문제에 나온대로 터트려야할 풍선이 위치하게 된다.
// 주의할점: 터트려야 할 풍선을 뻈다면, 자료형이 배열이라서 이미 오른쪽으로 한번 이동한 것과 같다.
// 따라서 오른쪽(양수)으로 이동은 1 적게 가고, 왼쪽(음수)이동은 이동해야 할 만큼 가야한다.
while true {
    let balloon = dq.popFront()!
    result.append(balloon)
    if result.count == N { break }
    var move = booms[balloon-1]
    if move > 0 {
        for i in 0..<move-1 {
            dq.pushRear(dq.popFront()!)
        }
    } else {
        for i in 0..<abs(move) {
            dq.pushFront(dq.popRear()!)
        }
    }
    
}
print(result.map{String($0)}.joined(separator: " "))
