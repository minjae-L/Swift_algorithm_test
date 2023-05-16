import Foundation

// 힙 구현
struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    
    var peek: T? {
        if self.isEmpty { return nil}
        return self.elements[1]
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFuntion: @escaping (T,T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFuntion
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
        if self.elements.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
    
}

// 우선순위 큐 구현
struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T,T) -> Bool) {
        heap = Heap(elements: elements, sortFuntion: sort)
    }
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func top() -> T? {
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


let count = Int(readLine()!)!
var classArr = [[Int]]()

// 수업들 입력받기
for i in 0..<count {
    let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
    classArr.append(inputs)
}

// 수업의 시작시간 기준으로 정렬
// 시작시간이 같다면 종료시간이 빠른순으로 정렬
var sortedArr = classArr.sorted{
    if $0[0] == $1[0] {
        return $0[1] < $1[1] } else {
        return $0[0] < $1[0]
    }}

// 우선순위큐에 첫번째 수업의 종료시간을 넣는다.
var pq = PriorityQueue([Int]() , { $0 < $1 })
pq.push(0)
pq.push(sortedArr[0][1])

// 오름차순으로 정렬된 수업배열을 우선순위큐의 첫번째 원소와 비교
// 우선순위의 첫번째 원소와 수업의 시작시간을 비교했을때,
// 원소값 <= 수업시작시간: 같은 강의실 사용한다. 원소값 pop 후 수업의 종료시간 push
// 원소값 > 수업시작시간: 수업시간이 겹치므로 다른 강의실 사용한다. 수업의 종료시간 push
for i in 1..<sortedArr.count {
    let s = sortedArr[i][0]
    let t = sortedArr[i][1]
    
    pq.push(t)
    if pq.top()! <= s {
        pq.pop()
    }

}

print(pq.count)

