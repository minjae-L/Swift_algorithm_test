import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

struct Queue {
    var elements = [Int]()
    var idx = 0
    var count: Int {
        return elements.count - idx
    }
    var front: Int {
        if elements.isEmpty || idx >= elements.count {
            return -1
        } else {
            return elements[idx]
        }
    }
    var back: Int {
        if elements.isEmpty || idx >= elements.count {
            return -1
        } else {
            return elements[elements.count - 1]
        }
    }
    var isEmpty: Int {
        if elements.isEmpty || idx >= elements.count {
            return 1
        } else {
            return 0
        }
    }
    
    mutating func push(element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int {
        if elements.isEmpty || idx >= elements.count  {
            return -1
        } else {
           let output = elements[idx]
            idx += 1
            
            return output
        }
    }
    
}
let fIO = FileIO()
let N = fIO.readInt()
var queue = Queue()
var answer = ""

for i in 0..<N {
    let operation = fIO.readString()
    switch operation {
    case 448:
        //push
        queue.push(element: fIO.readInt())
    case 335:
        //pop
        answer += "\(queue.pop())\n"
    case 443:
        //size
        answer += "\(queue.count)\n"
    case 559:
        //empty
        answer += "\(queue.isEmpty)\n"
    case 553:
        //front
        answer += "\(queue.front)\n"
    case 401:
        //back
        answer += "\(queue.back)\n"
    default:
        continue
    }
}

print(answer)
