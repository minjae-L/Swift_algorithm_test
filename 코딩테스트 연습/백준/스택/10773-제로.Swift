import Foundation

let K = Int(readLine()!)!
var stack = [Int]()

for i in 0..<K {
    let num = Int(readLine()!)!
    if num == 0 {
        stack.popLast()
    } else {
        stack.append(num)
    }
}

print(stack.reduce(0, +))

