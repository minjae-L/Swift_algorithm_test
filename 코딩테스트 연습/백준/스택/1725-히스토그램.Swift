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

// 입력받기
let N = Int(readLine()!)!
var arr = [Int]()
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}
// 스택 선언, sum: 넓이의 최댓값을 저장, width: 주어진 히스토그램의 총 너비길이
var stack = Stack(elements: [])
var sum = 0
var width = arr.count

/*
 주어진 히스토그램을 모두 조사
 스택에는 히스토그램의 위치(인덱스)가 저장된다.
 스택에는 막대그래프의 길이가 오름차순으로 주어진다면 스택에 추가하지만, 가장 상단의 원소보다 길이가 짧은 막대그래프를 만난다면,
 현재 막대그래프의 높이보다 짧은 막대그래프는 모두 pop한다.
 이때 pop하는 과정에서 높이와 너비를 통해 넓이를 구하고, 최댓값을 갱신한다.
 히스토그램의 막대그래프의 길이가 점점 증가하는 오름차순으로 주어진다면, 스택에 추가만 하므로 모든 히스토그램의 막대그래프를 순회했다면,
 스택에 원소가 남아있는지 추가로 검사하고 최대넓이를 구한다.
 */
for i in 0..<arr.count {
    // 스택이 비어있으면 추가
    if stack.isEmpty {
        stack.push(i)
        continue
    }
    // 스택의 최상단에 저장된 길이가 주어진 길이보다 크거나 같다면, 주어진 길이보다 작아질 때 까지 pop
    while !stack.isEmpty && arr[stack.peek!] >= arr[i] {
        // 높이는 스택의 최상단에 존재한 인덱스가 된다.
        let h = arr[stack.pop()!]
        var w = 0
        
        // 너비는 스택의 마지막 원소라면 현재위치까지의 길이가 됨
        // 아니면 현재 위치로부터 스택의 상단위치를 뺀만큼의 길이가 된다.
        if stack.isEmpty {
            w = i
        } else {
            w = i - 1 - stack.peek!
        }
        // 최댓값 갱신
        sum = max(sum, h*w)
    }
    //스택에 넣는다.
    stack.push(i)
}
// 스택에 원소가 남아있다면 추가적으로 조사
while !stack.isEmpty {
    let h = arr[stack.pop()!]
    var w = 0
    if stack.isEmpty {
        w = width
    } else {
        w = width - 1 - stack.peek!
    }
    sum = max(sum, h*w)
}
print(sum)
