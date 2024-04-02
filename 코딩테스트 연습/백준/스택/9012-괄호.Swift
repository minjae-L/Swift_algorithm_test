import Foundation
// 값 입력
let T = Int(readLine()!)!
// 스택
var stack = [String]()

for i in 0..<T {
    // 다음 문자열을 받기위해 스택 초기화
    stack.removeAll()
    // 문자열 입력
    let input = readLine()!.map{ String($0)}

    for j in input {
        // 열린 괄호는 스택에 추가
        if j == "(" {
            stack.append(j)
        } else if j == ")" {
            // 닫힌괄호도 추가하지만, 가장 최근에 열린괄호가 있다면, 해당 괄호와 함께 소거
            stack.append(j)
            if stack.count > 1 && stack[stack.count - 2] == "(" {
                stack.popLast()
                stack.popLast()
            }
        }
    }
    if stack.isEmpty {
        print("YES")
    } else {
        print("NO")
    }
}
