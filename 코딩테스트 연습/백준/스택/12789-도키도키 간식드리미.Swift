import Foundation

// 입력 받기
let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
var waitingStack = Array(input.reversed())
var spaceStack = [Int]()
var resultStack = [Int]()

for i in 1...N {
    // 여분 공간으로 이동한 순서는 기다리는 줄로 못돌아가기에 먼저 검사
    if !spaceStack.isEmpty {
        if spaceStack[spaceStack.count - 1] == i {
            resultStack.append(spaceStack.popLast()!)
            continue
        }
    }
    // 기다리는줄에서 순서 나올때까지 스택 Pop
    if !waitingStack.isEmpty {
        while waitingStack.count > 0 && !(waitingStack[waitingStack.count - 1] == i)  {
            spaceStack.append(waitingStack.popLast()!)
        }
        if waitingStack.isEmpty {
            break
        } else {
            resultStack.append(waitingStack.popLast()!)
        }
    }
    
}
// 모든 순서가 들어와 있는지
if resultStack.count == N {
    print("Nice")
} else {
    print("Sad")
}
