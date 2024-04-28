import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var stack = [Int]()
var result = Array(repeating: -1, count: N)

// 배열을 순차적으로 확인하며 인덱스를 스택에 저장한다.
// 순차적으로 확인할때, 큰 수를 만났다면 스택에서 pop후 그 값이 작은수라면 큰수로 치환해준다.스택이 빌때까지
for i in 0..<arr.count {
    //스택이 비어있다면 추가
    if stack.isEmpty {
        stack.append(i)
        continue
    }
    // 큰수를 만났다면 스택에서 꺼내면서 작은수들은 전부 큰수로 치환
    while !stack.isEmpty && arr[stack[stack.count-1]] < arr[i] {
        result[stack.removeLast()] = arr[i]
    }
    stack.append(i)
}
print(result.map{String($0)}.joined(separator: " "))
