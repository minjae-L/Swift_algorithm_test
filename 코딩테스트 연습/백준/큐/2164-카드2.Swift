import Foundation
// 큐 구현 (index를 통한 pop)
struct Queue {
    var elements = [Int]()
    var idx = 0
    var count: Int {
        return elements.count
    }
    var top: Int {
        if elements.isEmpty || idx >= elements.count {
            return -1
        } else {
            return elements[idx]
        }
    }
    mutating func pop() -> Int {
        if elements.isEmpty || idx >= elements.count {
            return -1
        } else {
            let num = elements[idx]
            idx += 1
            return num
        }
    }
    
    mutating func moveToBack(element: Int) {
        if idx <= elements.count {
            elements.append(element)
        }
    }
}

let N = Int(readLine()!)!
var queue = Queue()
queue.elements = Array(1...N)
// index로 접근하기 때문에, 모든 동작이 완료될때까지
// 1번동작: pop, 2번동작: pop and move to back
// pop을 한 원소가 마지막인경우 출력, pop을 한 다음 원소 한개가 남은경우 2번동작 후 출력
// 마지막 순서로 옮기면 앞 원소가 pop되는거라 index가 증가해야 하지만 pop에서 이미 증가시키므로 추가로 증가하지않는다
while queue.idx < queue.count {
    let num = queue.pop()
    if queue.top == -1 {
        print(num)
        break
    }
    queue.moveToBack(element: queue.pop())
}
