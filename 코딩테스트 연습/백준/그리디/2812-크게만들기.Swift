import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var rmCount = input[1]
var num = readLine()!.map{ Int(String($0))! }
var stack = [Int]()

// 앞자리부터 스택에 넣는다.
// 스택의 맨 뒤가 현재 원소보다 작을 경우, 현재 원소보다 작은값들은 k번 만큼 지워준다.
// 숫자가 내림차순으로 되있는 경우, k번 지울 수 없기에 뒷부분을 남은 횟수만큼 지워준다.
for i in 0..<input[0] {
    if stack.isEmpty {
        stack.append(num[i])
        continue
    }
    while !stack.isEmpty && stack[stack.count - 1] < num[i] && rmCount > 0 {
        rmCount -= 1
        stack.popLast()
    }
    stack.append(num[i])
}

if rmCount > 0 {
    while rmCount > 0 {
        rmCount -= 1
        stack.popLast()
    }
}
print(stack.map{ String($0)}.joined(separator: ""))
