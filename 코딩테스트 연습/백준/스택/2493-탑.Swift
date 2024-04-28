import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = Array(readLine()!.split(separator: " ").map{Int(String($0))!}.reversed())
var stack = [Int]()
var result = Array(repeating: 0, count: N)

// 배열 arr은 주어진 탑의 순서를 뒤집어놓았다.
// arr순회할때마다, 스택이 비어있거나 스택의 top이 현재 값보다 작다면 스택에 추가한다.
// 스택의 top보다 현재 주어진 값이 더 크다면 스택에 있는 모든 값들을 현재값들과 비교하여 pop한다.
for i in 0..<arr.count {
    if stack.isEmpty {
        stack.append(i)
        continue
    }
    while !stack.isEmpty && arr[i] > arr[stack[stack.count - 1]] {
        // 정답의 인덱스는 첫번째가 1이므로 i+1 (0은 수신불가표시하기위해)
        result[stack.removeLast()] = i+1
    }
    stack.append(i)
}

// 배열 뒤집어놓은것을 다시 돌려놓고, 출력
for i in 0..<result.count {
    if result[i] == 0 { continue }
    result[i] = (N+1) - result[i]
}
print(Array(result.reversed()).map{String($0)}.joined(separator: " "))
