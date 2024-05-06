import Foundation

// 스택 구현
struct Stack <T: Equatable>{
    var elements = [T]()
    
    init(elements: [T] = [T]()) {
        self.elements = elements
    }
    var peek: T? {
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
    var count: Int {
        if elements.isEmpty {
            return 0
        } else {
            return elements.count
        }
    }
    func isContains(_ num: T) -> Bool {
        if elements.isEmpty || !elements.contains(num) {
            return false
        }
        return true
    }
    mutating func push(_ element: T) {
        self.elements.append(element)
    }
    mutating func pop() -> T? {
        if elements.isEmpty {
            return nil
        }
        return elements.removeLast()
    }
}

// 입력받기
var arr = Array(readLine()!)
var stack = Stack(elements: [Character]())
var answer = 0
var idx = 0

// 주어진 문자 확인
while idx < arr.count {
    var s = arr[idx]
    if s == "(" {
        // 레이저인경우
        if idx < arr.count-1 && arr[idx+1] == ")" {
            answer += stack.count
            idx += 2
        } else {
            // 레이저가 아닌경우
            stack.push(s)
            idx += 1
        }
    } else {
        // 괄호닫힘(쇠막대기가 끝남)
        answer += 1
        stack.pop()
        idx += 1
    }
}
print(answer)
