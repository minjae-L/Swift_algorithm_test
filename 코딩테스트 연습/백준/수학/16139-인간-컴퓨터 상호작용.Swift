import Foundation

// 입력받기
var S = Array(readLine()!)
// 문자갯수의 부분합
var dict = [[Character : Int]]()
dict.append(["-": 0])
var answer = ""
var temp = [Character: Int]()
// 부분합 구하기
for i in 0..<S.count {
    if temp[S[i]] == nil {
        temp[S[i]] = 1
    } else {
        temp[S[i]]! += 1
    }
    dict.append(temp)
}

// 주어진 문자의 나타나는 횟수 구하기
let q = Int(readLine()!)!
for i in 0..<q {
    let op = readLine()!.split(separator: " ").map{String($0)}
    let left = dict[Int(op[1])!][Character(op[0])]
    let right = dict[Int(op[2])!+1][Character(op[0])]

    if left == nil && right == nil {
        answer += "0\n"
    } else if left == nil && right != nil {
        answer += "\(right!)\n"
    } else {
        answer += "\(right! - left!)\n"
    }
}
print(answer)
