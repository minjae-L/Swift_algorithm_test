import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = [Int]()
// 스택에 튜플형식으로 저장
// 같은 높이의 인원도 볼 수 있으므로
var stack = [(num: Int, height: Int)]()
var count = 0
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}
print(arr)
for i in 0..<arr.count {
    var current = (num: 1, height: arr[i])
    // 현재 사람의 높이보다 작거나 같은 인원들은 모두 볼 수 있는사람들이다.
    // 해당 인원들은 모두 볼 수 있는 쌍이 되므로, 그만큼 count를 더해준다.
    // 키가 같은 인원도 볼 수 있으므로, 키가 같다면 키가 같은 인원수를 더해서 스택에 다시 넣어준다.
    while !stack.isEmpty && stack.last!.height <= current.height {
        if stack.last!.height == arr[i] {
            count += stack.last!.num
            current.num += stack.removeLast().num
        } else if stack.last!.height < arr[i] {
            count += stack.removeLast().num
        }
    }
    // 스택은 키가 내림차순으로 저장된다.
    // 스택에 값이 존재한다면, 이는 내림차순으로 정렬되었을때
    // 현재 사람과 바로 직전의 사람과의 중간은 사람이 존재하지않으므로 무조건 볼 수 있는 사이다.
    if !stack.isEmpty {
        count += 1
    }
    stack.append(current)
}
print(count)
