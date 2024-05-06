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
// 입력값이 0이 나올때까지 입력받는다.
while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    if input[0] == 0 { break }
    
    // 주어진 히스토그램의 너비 길이
    let width = input.count-1
    // 스택
    var stack = Stack(elements: [])
    // 최대 직사각형의 넓이를 저장할 변수
    var sum = Int.min
    // 모든 히스토그램의 막대그래프를 조사
    for i in 1...input[0] {
        // 스택이 비어있다면 스택에 추가
        // 스택에 추가하는것은 높이가 아닌 막대그래프의 위치(인덱스)다.
        if stack.isEmpty {
            stack.push(i)
            continue
        }
        // 스택에 저장하던도중 스택의 상단 원소보다 현재 막대그래프의 높이가 짧다면,
        // 현재 막대그래프보다 길이가 짧은 모든 원소를 pop한다.
        // 이때 직사각형의 넓이를 구해서 최댓값을 갱신한다.
        while !stack.isEmpty && input[stack.peek!] >= input[i] {
            // 높이는 stack에서 빼낸 상단의 원소(인덱스)
            let h = input[stack.pop()!]
            // 너비는 스택이 비어있다면 현재 위치까지의 길이가 됨
            // 비어있지 않다면 현재위치에서 스택의 상단원소(인덱스)를 뺀 값
            var w = 0
            if stack.isEmpty {
                w = i - 1
            } else {
                w = i - 1 - stack.peek!
            }
            // 최댓값 갱신
            sum = max(sum, w * h)
        }
        stack.push(i)
    }
    // 스택에 원소가 남아있다면 추가조사
    while !stack.isEmpty {
        let idx = stack.pop()!
        let h = input[idx]
        var w = 0
        if stack.isEmpty {
            w = width
        } else {
            w = width  - stack.peek!
        }
        sum = max(sum, w * h)
    }
    print(sum)
}
