import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = [[Int]]()
var result = Int.min
for i in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 움직이기
func move(count: Int, arr: [[Int]]) {
    // 5번 움직였다면 최댓값 구하고 끝내기
    if count == 5 {
        for i in 0..<N {
            result = max(result, arr[i].max()!)
        }
        return
    }
    
    //UP 위로이동
    var board = arr
    for i in 0..<N {
        var insert = [Int]()
        for j in 0..<N {
            // 0이 아닌값들을 저장
            if board[j][i] != 0 {
                insert.append(board[j][i])
                board[j][i] = 0
            }
        }
        // 모든값이 0이라면 insert에 저장되지않았으므로 패스
        if !insert.isEmpty {
            var index = 0
            var arrIndex = 0
            // 같은값이면 더해서 가장 위로 올려주기
            while arrIndex < insert.count - 1 {
                if insert[arrIndex] == insert[arrIndex+1] {
                    board[index][i] = insert[arrIndex] * 2
                    arrIndex += 2
                } else {
                    board[index][i] = insert[arrIndex]
                    arrIndex += 1
                }
                index += 1
            }
            // 맨 마지막번째 수가 합쳐지지않았다면 마지막번에 저장
            if arrIndex < insert.count {
                board[index][i] = insert[arrIndex]
            }
        }
    }
    // 위로 이동 후 이동한 보드를 그대로 다른방향으로 이동
    move(count: count+1, arr: board)
    
    //DOWN 아래로 이동
    board = arr
    for i in 0..<N {
        var insert = [Int]()
        for j in (0..<N).reversed() {
            if board[j][i] != 0 {
                insert.append(board[j][i])
                board[j][i] = 0
            }
        }
        if !insert.isEmpty {
            var index = N-1
            var arrIndex = 0
            while arrIndex < insert.count - 1 {
                if insert[arrIndex] == insert[arrIndex+1] {
                    board[index][i] = insert[arrIndex] * 2
                    arrIndex += 2
                } else {
                    board[index][i] = insert[arrIndex]
                    arrIndex += 1
                }
                index -= 1
            }
            if arrIndex < insert.count {
                board[index][i] = insert[arrIndex]
            }
        }
    }
    // 아래로 이동후 다른방향으로 이동
    move(count: count+1, arr: board)
    
    //LEFT 왼쪽 이동
    board = arr
    for i in 0..<N {
        var insert = [Int]()
        for j in 0..<N {
            if board[i][j] != 0 {
                insert.append(board[i][j])
                board[i][j] = 0
            }
        }
        if !insert.isEmpty {
            var index = 0
            var arrIndex = 0
            while arrIndex < insert.count - 1 {
                if insert[arrIndex] == insert[arrIndex+1] {
                    board[i][index] = insert[arrIndex] * 2
                    arrIndex += 2
                } else {
                    board[i][index] = insert[arrIndex]
                    arrIndex += 1
                }
                index += 1
            }
            if arrIndex < insert.count {
                board[i][index] = insert[arrIndex]
            }
        }
    }
    // 왼쪽으로 이동후 다른방향으로 이동
    move(count: count+1, arr: board)
    
    //RIGHT 오른쪽 이동
    board = arr
    for i in 0..<N {
        var insert = [Int]()
        for j in (0..<N).reversed() {
            if board[i][j] != 0 {
                insert.append(board[i][j])
                board[i][j] = 0
            }
        }
        if !insert.isEmpty {
            var index = N-1
            var arrIndex = 0
            while arrIndex < insert.count - 1 {
                if insert[arrIndex] == insert[arrIndex+1] {
                    board[i][index] = insert[arrIndex] * 2
                    arrIndex += 2
                } else {
                    board[i][index] = insert[arrIndex]
                    arrIndex += 1
                }
                index -= 1
            }
            if arrIndex < insert.count {
                board[i][index] = insert[arrIndex]
            }
        }
    }
    // 오른쪽으로 이동 후 다른방향으로 이동
    move(count: count+1, arr: board)
}

move(count: 0, arr: arr)
print(result)
