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

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
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

// 덱
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
    mutating func last() -> T? {
        if enqueue.isEmpty {
            if dequeue.isEmpty {
                return nil
            } else {
                return dequeue[0]
            }
        } else {
            return enqueue.last
        }
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
let fIO = FileIO()
let N = fIO.readInt()
var dq = Deque(enqueue: [Int]())

for i in 0..<N {
    let op = fIO.readInt()
    
    switch op {
    case 1:
        let element = fIO.readInt()
        dq.pushFront(element)
    case 2:
        let element = fIO.readInt()
        dq.pushRear(element)
    case 3:
        if let popFir = dq.popFront() {
            print(popFir)
        } else {
            print(-1)
        }
    case 4:
        if let popLas = dq.popRear() {
            print(popLas)
        } else {
            print(-1)
        }
    case 5:
        print(dq.count)
    case 6:
        print(dq.isEmpty ? 1 : 0)
    case 7:
        if let fir = dq.first() {
            print(fir)
        } else {
            print(-1)
        }
    case 8:
        if let las = dq.last() {
            print(las)
        } else {
            print(-1)
        }
    default: continue
    }
}
