import Foundation
// 입력받기
let str = readLine()!
let M = Int(readLine()!)!
var rightStack = ""
var leftStack = str

// 명령어 실행
for i in 0..<M {
    let op = readLine()!
    switch op {
    case "L":
        if !leftStack.isEmpty {
            rightStack.append(leftStack.removeLast())
        }
    case "D":
        if !rightStack.isEmpty {
            leftStack.append(rightStack.removeLast())
        }
    case "B":
        if !leftStack.isEmpty {
            leftStack.removeLast()
        }
    default:
        leftStack.append(op.last!)
    }
}

print(leftStack + rightStack.reversed())
