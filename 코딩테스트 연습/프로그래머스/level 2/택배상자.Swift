import Foundation

func solution(_ order:[Int]) -> Int {
    var result = 0
    var stack = [Int]()
    var idx = 0
    var i = 1
    
    while i < order.count + 1 {
        var check = order[idx]
        if i == check {
            result += 1
            idx += 1
            i += 1
        } else if !stack.isEmpty && stack.last! == check {
            idx += 1
            stack.popLast()!
            result += 1
        } else {
            stack.append(i)
            i += 1
        }
    }
    
    while !stack.isEmpty {
        if stack.popLast()! == order[idx] {
            result += 1
            idx += 1
        } else {
            break
        }
        
    }
    
    return result
}
