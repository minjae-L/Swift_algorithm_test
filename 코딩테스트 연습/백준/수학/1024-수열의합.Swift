import Foundation

//입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = 0
var sum = 0
var result = [Int]()

// 수열의 길이 2부터 100까지 검색
while answer < 100 {
    answer += 1
    
    // 수열의 합을 구한다.
    var plus = 0
    for i in 1..<answer {
        plus += i
    }
    var dev = input[0] - plus
    
    // plus의 값이 N보다 커진다면, 수열로 나타낼 수 없다(수열의 길이가 너무 길다)
    if dev < 0 {
        break
    }
    // 수열의합을 구했을때, a가 N보다 작은 수라면 연속된 수열이 존재한다고 판단.
    var a = Double(dev) / Double(answer)
    if dev % answer == 0 && answer >= input[1] {
        result.append(Int(a))
        break
    }
    
}

if result.isEmpty {
    print(-1)
} else {
    for i in 1..<answer {
        result.append(result[0]+i)
    }
    print(result.map{String($0)}.joined(separator: " "))
}
