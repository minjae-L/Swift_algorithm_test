import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = Array(readLine()!.split(separator: " ").map{Int(String($0))!}.reversed())
// 등장횟수 저장할 배열
var nums = Array(repeating: 0, count: 1000001)
for i in arr {
    nums[i] += 1
}
// 스택과 결과를 저장할 배열
var result = [Int]()
var stack = [Int]()
var answer = ""

// 주어진 수열의 마지막원소부터 검사
for i in 0..<arr.count {
    // 스택의 상단원소가 현재원소보다 등장횟수가 많은 원소가 위치하도록 Pop
    while !stack.isEmpty && nums[stack[stack.count-1]] <= nums[arr[i]] {
        stack.removeLast()
    }
    // 스택이 비어있다면 오등큰수는 존재하지않음
    // 비어있지 않다면 오등큰수는 스택의 상단원소가 됨
    if stack.isEmpty {
        result.append(-1)
    } else {
        result.append(stack.last!)
    }
    // 오른쪽에 위치한 원소중 가장 왼쪽에 있는 원소가 오등큰수가 되므로 현재원소를 스택에 넣어준다.
    stack.append(arr[i])
}

// 결과 출력
for i in (0..<result.count).reversed() {
    if i == 0 {
        answer += "\(result[i])"
    } else {
        answer += "\(result[i]) "
    }
}
print(answer)
