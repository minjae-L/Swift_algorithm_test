import Foundation

// 스택 구현
struct Stack {
    var elements = [Int]()
    
    init(elements: [Int] = [Int]()) {
        self.elements = elements
    }
    var peek: Int? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.last!
        }
    }
    var isEmpty: Bool {
        if elements.isEmpty {
            return true
        } else {
            return false
        }
    }
    func isContains(_ num: Int) -> Bool {
        if elements.isEmpty || !elements.contains(num) {
            return false
        }
        return true
    }
    mutating func push(_ element: Int) {
        self.elements.append(element)
    }
    mutating func pop() -> Int? {
        if elements.isEmpty {
            return nil
        }
        return elements.removeLast()
    }
}

// 입력바딕
let n = Int(readLine()!)!
var arr = [Int]()
var stack = Stack(elements: [])
var current = 1
var answer = ""
// 주어진 값 조사
for i in 0..<n {
    let num = Int(readLine()!)!
    var out = -1
    // 스택에 없으면 push
    while num >= current {
        stack.push(current)
        current += 1
        answer += "+\n"
    }
    // 스택에 존재하면 pop
    while !stack.isEmpty && stack.isContains(num) {
        let n = stack.pop()!
        answer += "-\n"
        if n == num {
            out = n
            break
        }
    }
    // 스택에도 없고, 새로운 값을 Push해도 얻을 수 없는 경우
    if out == -1 {
        answer = "NO"
        break
    }
    
}
print(answer)


