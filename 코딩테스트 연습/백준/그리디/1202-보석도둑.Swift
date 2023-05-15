import Foundation

// Heap 구현
struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count <= 1
    }
    
    var peek: T? {
        if self.isEmpty { return nil}
        return self.elements[1]
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T,T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return index / 2
    }
    
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
            return
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    
    mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func remove() -> T? {
        if self.elements.isEmpty { return nil}
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

// 우선순위큐 구현
struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T,T) -> Bool) {
        heap = Heap(elements: elements, sortFunction: sort)
    }
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func top () -> T? {
        return heap.peek
    }
    
    mutating func clear() {
        while !heap.isEmpty {
            heap.remove()
        }
    }
    
    mutating func pop() -> T? {
        return heap.remove()
    }
    
    mutating func push(_ element: T) {
        heap.insert(node: element)
    }
}

var inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var jewelys = [(m: Int, v: Int)]()
var bags = [Int]()
var result: UInt64 = 0

// 보석들을 튜플로 입력
for i in 0..<inputs[0] {
    var num = readLine()!.split(separator: " ").map{ Int($0)! }
    jewelys.append((num[0], num[1]))
}

// 가방 입력
for i in 0..<inputs[1] {
    bags.append(Int(readLine()!)!)
}

// 보석들의 무게를 오름차순으로 정렬
// 가방의 최대무게를 오름차순으로 정렬
jewelys.sort{ $0.0 < $1.0 }
bags.sort{ $0 < $1 }

// 우선순위큐 선언 (보석의 가치가 높은순)
// 같은 보석을 넣지 않도록 Idx를 따로 선언
// 우선순위큐의 구조상 isEmpty를 사용하기위해 따로 0을 push (필수가아님)
var idx = 0
var pq = PriorityQueue([Int](), { $0 > $1})
pq.push(0)

for i in 0..<bags.count {
    
    // 보석들중에 가방의 최대무게보다 작거나 같은 보석들을 큐에 저장
    while idx < jewelys.count {
        if jewelys[idx].m <= bags[i] {
            pq.push(jewelys[idx].v)     // 우선순위큐에 보석의 가치 push
        } else {
            break
        }
        idx += 1
    }
    // 해당 가방의 최대무게보다 작거나 같은 보석이 있을경우
    // 보석중의 가장 가치가높은(우선순위큐의 제일 첫번째 원소의값)을 결과값에 저장
    // 첫번쨰원소 pop
    if !pq.isEmpty {
        result += UInt64(pq.top()!)
        pq.pop()
        
    }
}

print(result)
