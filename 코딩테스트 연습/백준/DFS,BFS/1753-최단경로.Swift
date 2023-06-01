import Foundation

struct Heap<T: Comparable> {
    private var elements = [T]()
    private let sortFunction: (T,T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    var peek: T? {
        if self.elements.isEmpty { return nil}
        return self.elements[1]
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction:@escaping (T,T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        
        if self.elements.count > 1 {
            buildHeap()
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
            self.elements.swapAt(index, higherPriority)
            self.diveDown(from: higherPriority)
        }
    }
    
    mutating func buildHeap() {
        for index in (1...self.elements.count / 2).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func remove() -> T? {
        if self.elements.isEmpty { return nil }
        self.elements.swapAt(1, self.elements.endIndex - 1)
        let deleted = self.elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init( elements: [T] = [], sort: @escaping (T,T) -> Bool) {
        heap = Heap(elements: elements, sortFunction: sort)
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
    mutating func push(element: T) {
        heap.insert(node: element)
    }
}
struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
    
    init(_ node: Int,_ cost: Int) {
        self.node = node
        self.cost = cost
    }
    let node: Int
    let cost: Int
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var k = Int(readLine()!)!
var arr = Array(repeating: Array<(Int, Int)>(), count: input[0] + 1)
var dp = Array(repeating: Int.max, count: input[0]+1)
dp[k] = 0
for i in 0..<input[1] {
    let inp = readLine()!.split(separator: " ").map{ Int($0)! }
    let (s, a, c) = (inp[0], inp[1], inp[2])
    arr[s].append((a, c))
}

func dijkstra(start: Int) {
    var pq = PriorityQueue<Node>(sort: < )
    pq.push(element: Node(start, 0))
    pq.push(element: Node(start, 0))
    
    while !pq.isEmpty {
        let nd = pq.pop()!
        if dp[nd.node] < nd.cost {
            continue
        }
        
        for next in arr[nd.node] {
            let cost = nd.cost + next.1
            
            if cost < dp[next.0] {
                dp[next.0] = cost
                pq.push(element: Node(next.0, cost))
            }
        }
    }
}

dijkstra(start: k)

for i in 1..<dp.count {
    if dp[i] == Int.max {
        print("INF")
    } else {
        print(dp[i])
    }
}
