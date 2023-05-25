import Foundation

var inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[String]]()
var result = 0
var isFind = false

// 배열 입력
for i in 0..<inputs[0] {
    var a = readLine()!.map{String($0)}
    arr.append(a)
}

// 현재 위치에서 오른쪽대각위, 오른쪽, 오른쪽대각아래 순으로 검사한다.
// 마지막열에 도달했다면, 경로를 찾은것,
// 경로를 찾았다면 이전의 재귀함수들을 모두 실행중단해준다.
func find(x: Int, y: Int) {
    arr[x][y] = "O"
    if y == inputs[1] - 1 {
        isFind = true
        result += 1
        return
    }
    if x > 0 && arr[x-1][y+1] == "." {
        if isFind { return }
            find(x: x-1, y: y+1)
    }
    if arr[x][y+1] == "." {
        if isFind { return }
        find(x: x, y: y+1)
    }
    if x < inputs[0] - 1 && arr[x+1][y+1] == "." {
        if isFind { return }
        find(x: x+1, y: y+1)
    }
    
}
for i in 0..<inputs[0] {
    isFind = false
    find(x: i, y: 0)
}
print(result)
