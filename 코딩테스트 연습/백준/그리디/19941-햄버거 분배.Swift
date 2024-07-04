import Foundation

// 입력 받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
var string = readLine()!.map{String($0)}
var count = 0

// 식탁의 가장 왼쪽부터 햄버거와 사람의 거리를 잰다.
// 사람이 가능한 가장 왼쪽의 햄버거를 먹어서 최댓값을 구한다.
for i in 0..<string.count {
    if string[i] == "H" || string[i] == "E"{ continue }
    let start = i - K
    let end = i + K
    
    for j in start...end {
        if j < 0 || j >= string.count { continue }
        if string[j] == "H" {
            string[j] = "E"
            count+=1
            break
        }
    }
}

print(count)
