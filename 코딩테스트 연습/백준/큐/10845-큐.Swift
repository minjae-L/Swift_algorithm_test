import Foundation

// Queue 구조체 구현
struct Queue {
    var element: [Int]
    var idx: Int = 0
    
    mutating func push(num: Int) {
        element.append(num)
    }
    
    mutating func pop() -> Int {
        if element.count <= idx {
            return -1
        } else {
            let out = element[idx]
            idx += 1
            return out
        }
    }
    var size: Int {
        return element.count - idx
    }
    var empty: Int {
        if element.count <= idx {
            return 1
        } else {
            return 0
        }
    }
    
    var front: Int {
        if element.count <= idx {
            return -1
        } else {
            return element[idx]
        }
    }
    
    var back: Int {
        if element.count <= idx {
            return -1
        } else {
            return element[element.count-1]
        }
    }
}

// 입력받기
let N = Int(readLine()!)!
// 큐 생성
var queue = Queue(element: [])
// 명령어 받고 처리
for _ in 0..<N {
    let op = readLine()!.split(separator: " ").map{$0}
    
    switch op[0] {
    case "push":
        queue.push(num: Int(op[1])!)
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size)
    case "empty":
        print(queue.empty)
    case "front":
        print(queue.front)
    case "back":
        print(queue.back)
    default:
        continue
    }
}
