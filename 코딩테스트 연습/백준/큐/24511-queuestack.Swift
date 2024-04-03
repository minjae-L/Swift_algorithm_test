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
// 큐
struct Queue<T> {
    var elements: [T]
    var idx = 0
    
    init(elements: [T]) {
        self.elements = elements
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    mutating func push(element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        if elements.isEmpty || idx >= elements.count { return nil }
        let value = elements[idx]
        idx += 1
        return value
    }
}
// 입력
let fIO = FileIO()
let N = fIO.readInt()
var dataStruct = [Int]()
var elements = [Int]()
var inputElements = [Int]()
var queueIndexArr = [Bool]()
// 스택구조는 패스하고, 큐 구조의 원소만 받는다. 나중에 원소도 넣기위해 인덱스를 저장
for i in 0..<N {
    let input = fIO.readInt()
    if input == 0 {
        dataStruct.append(input)
        queueIndexArr.append(true)
    } else {
        queueIndexArr.append(false)
    }

}
// 저장해둔 인덱스에 따라 큐구조의 원소만 넣는다.
for i in 0..<N {
    let input = fIO.readInt()
    if queueIndexArr[i] {
        elements.append(input)
    }
}
let M = fIO.readInt()
for i in 0..<M {
    inputElements.append(fIO.readInt())
}
// 큐 구조만 가려서 만든 원소들을 하나의 큰 큐 배열로 만든다.
var queue = Queue(elements: elements.reversed())
var answer = ""

// queuestack에 넣을 원소들을 차례로 넣고 결과 출력
if queue.isEmpty {
    for i in 0..<inputElements.count {
        if i == inputElements.count-1 {
            answer += "\(inputElements[i])"
        } else {
            answer += "\(inputElements[i]) "
        }
    }
} else {
    for i in 0..<inputElements.count {
        queue.push(element: inputElements[i])
        if i == inputElements.count - 1 {
            answer += "\(queue.pop()!)"
        } else {
            answer += "\(queue.pop()!) "
        }
    }
}
print(answer)
