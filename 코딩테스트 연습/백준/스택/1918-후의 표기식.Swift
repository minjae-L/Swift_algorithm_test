import Foundation

// 입력받기
var str = Array(readLine()!).map{String($0)}
var answer = [String]()
var idx = 0
var stack = [String]()
var ops: [String] = ["+", "-", "/", "*", "(", ")"]

// 탐색
while idx < str.count {
    // 연산자인경우
    if ops.contains(str[idx]) {
        if str[idx] == ")" {
            // 괄호닫힘기호라면, 괄호 열린기호까지 모든 연산자를 pop
            while !stack.isEmpty && stack.last! != "(" {
                answer.append(stack.removeLast())
            }
            if !stack.isEmpty { stack.removeLast() }
        } else if str[idx] == "*" || str[idx] == "/" {
            // 곱셈 나눗셈 연산이면, 같은 우선순위의 연산자나, 스택이 빌떄까지 pop
            while !stack.isEmpty && (stack.last! == "*" || stack.last! == "/" ) {
                answer.append(stack.removeLast())
            }
            stack.append(str[idx])
        } else if str[idx] == "+" || str[idx] == "-" {
            // 덧셈 뺄셈 연산이면, 괄호가 닫히는점이나 스택이 빌때까지 pop
            while !stack.isEmpty && stack.last! != "(" {
                answer.append(stack.removeLast())
            }
            stack.append(str[idx])
        } else {
            stack.append(str[idx])
        }
        
        
    } else {
        // 알파벳인 경우 그냥추가
        answer.append(str[idx])
    }
    idx += 1
}
// 스택에 남아있는 연산까지 모두 붙여준다.
while !stack.isEmpty {
    let last = stack.removeLast()
    if last == "(" { continue }
    answer.append(last)
}
print(answer.joined())
