import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let L = input[0], C = input[1]
let alphabet = readLine()!.split(separator: " ").map{String($0)}
let aeiou = ["a", "e", "i", "o", "u"]
var result = Set<String>()

// 조합
func combi(_ targetArr: [String],_ targetNum: Int,_ index: Int,_ arr: [String]) {
    // L길이의 암호를 뽑았다면 조건 확인
    if arr.count == targetNum {
        if check(arr) {
            result.insert((arr.sorted(by: <).joined()))
        }
        return
    }
    for i in index..<targetArr.count {
        combi(targetArr, targetNum, i+1, arr + [targetArr[i]])
    }
}

// 조건 확인 함수
func check(_ arr: [String]) -> Bool {
    var minimumAE = 0
    var minimumBC = 0
    for i in 0..<arr.count {
        if aeiou.contains(arr[i]) {
            minimumAE += 1
        } else {
            minimumBC += 1
        }
    }
    if minimumAE >= 1 && minimumBC >= 2 {
        return true
    } else {
        return false
    }
}
combi(alphabet, L, 0, [])

for i in result.sorted(by: <) {
    print(i)
}
