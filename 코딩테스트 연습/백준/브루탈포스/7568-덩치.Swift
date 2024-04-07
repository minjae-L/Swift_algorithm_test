import Foundation

// 입력받기
let N = Int(readLine()!)!
var person = [(index: Int, x: Int, y: Int)]()
var result = ""
for i in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    person.append((1,input[0], input[1]))
}

// 완전탐색
// 해당 인원과 다른 모든인원과 비교하여 덩치가 크면 +1
for i in 0..<N {
    for j in 0..<N {
        if person[i].x < person[j].x && person[i].y < person[j].y {
            person[i].index += 1
        }
    }
    if i == N - 1 {
        result += "\(person[i].index)"
    } else {
        result += "\(person[i].index) "
    }
}
print(result)
