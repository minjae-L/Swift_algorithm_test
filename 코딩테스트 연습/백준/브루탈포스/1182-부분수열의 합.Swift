import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1]
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0

// 조합(숫자의 순서와 관계없이 선택)
func combi(_ targetArr: [Int],_ targetNum: Int,_ index: Int,_ arr: [Int] ) {
    if arr.count == targetNum {
        if arr.reduce(0, +) == S { result += 1 }
        return
    }
    for i in index..<targetArr.count {
        combi(targetArr, targetNum, i+1, arr + [targetArr[i]])
    }
}

for i in 1...N {
    combi(nums, i, 0, [])
}

print(result)
