import Foundation

// 입력받기
var leftStack = Array(readLine()!)
let bomb = Array(readLine()!)
let bCount = bomb.count
var rightStack = [Character]()

// 스택에 넣기
while !leftStack.isEmpty {
    rightStack.append(leftStack.removeLast())
    // 스택이 폭발 문자열길이만큼 넣어졌다면 검사
    if rightStack.count >= bCount {
        check()
    }
}
// 스택의 상단원소부터 폭발 문자열 길이만큼의 문자를 뽑아서, 해당 문자와 폭발 문자열이 같은 경우 pop
func check() {
    var s = [Character]()
    for i in (rightStack.count-bCount..<rightStack.count).reversed() {
        s.append(rightStack[i])
    }
    if s == bomb {
        for i in 0..<s.count {
            rightStack.removeLast()
        }
    }
}

if rightStack.isEmpty {
    print("FRULA")
} else {
    print(String(rightStack.reversed()))
}
