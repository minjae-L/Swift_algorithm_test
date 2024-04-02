import Foundation

enum Operation: Int {
    case op1 = 1, op2, op3, op4, op5
}

struct Stack {
    var elements = [Int]()
    
    var count : Int {
        return elements.count
    }
    
    var top: Int {
        if elements.isEmpty {
            return -1
        } else {
            return elements[elements.count - 1]
        }
    }
    
    mutating func addElement(element: Int) {
        elements.append(element)
    }
    
    mutating func popTop() -> Int {
        if elements.count == 0 {
            return -1
        } else {
            return elements.popLast()!
        }
    }
    
    func checkEmpty() -> Int {
        if elements.count == 0 {
            return 1
        } else {
            return 0
        }
    }
}

var stack = Stack()
let N = Int(readLine()!)!

for i in 0..<N {
    let operationNumArray = readLine()!.split(separator: " ").map{ Int($0)! }
    
    switch operationNumArray[0] {
    case 1:
        stack.addElement(element: operationNumArray[1])
    case 2:
        print(stack.popTop())
    case 3:
        print(stack.count)
    case 4:
        print(stack.checkEmpty())
    case 5:
        print(stack.top)
    default:
        print("Error")
    }
}
