import Foundation

struct Heap<T: Comparable> {
    var elements: [T] = []
    var sortFunction: (T,T) -> Bool
    var isEmpty: Bool {
        return elements.isEmpty || elements.count == 1
    }
    var peek: T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements[1]
        }
    }
    var count: Int {
        if elements.isEmpty {
            return 0
        } else {
            return elements.count - 1
        }
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
        var idx = index
        while idx != 1 && self.sortFunction(self.elements[idx], self.elements[parent(of: idx)]) {
            self.elements.swapAt(idx, self.parent(of: idx))
            idx = self.parent(of: idx)
        }
    }
    mutating func insert(element: T) {
        if self.elements.isEmpty {
            self.elements.append(element)
            self.elements.append(element)
            return
        }
        self.elements.append(element)
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
        for i in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: i)
        }
    }
    mutating func remove() -> T? {
        if self.isEmpty {
            return nil
        }
        self.elements.swapAt(1, self.elements.endIndex - 1)
        var returnValue = self.elements.removeLast()
        self.diveDown(from: 1)
        
        return returnValue
    }
}

let N = Int(readLine()!)!
var heap = Heap(elements: [Int](),sortFunction: { if abs($0) == abs($1) {
    return $0 < $1
} else {
    return abs($0) < abs($1)
}})

for i in 0..<N {
    let num = Int(readLine()!)!
    if num == 0 {
        if let poped = heap.remove() {
            print(poped)
        } else {
            print(0)
        }
    } else {
        heap.insert(element: num)
    }
}
