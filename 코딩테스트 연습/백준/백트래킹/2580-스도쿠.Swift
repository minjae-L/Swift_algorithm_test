import Foundation

//입력받기
var board = [[Int]]()
var result = [[Int]]()
var blank = [(x: Int, y: Int)]()
for i in 0..<9 {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    for j in 0..<board[i].count {
        if board[i][j] == 0 {
            blank.append((x: i, y: j))
        }
    }
}

// 세로 비교
func col(loc: (x: Int, y: Int), num: Int) -> Bool {
    for i in 0..<9 {
        if board[i][loc.y] == num {
            return true
        }
    }
    return false
}

//가로 비교
func row(loc: (x: Int, y: Int), num: Int) -> Bool {
    return board[loc.x].contains(num)
}

// 인접된 사각형 비교
func square(loc: (x: Int, y: Int), num: Int) -> Bool {
    let leftUp = (x: loc.x / 3 * 3, y: loc.y / 3 * 3)
    for i in leftUp.x..<leftUp.x + 3 {
        for j in leftUp.y..<leftUp.y+3 {
            if board[i][j] == num {
                return true
            }
        }
    }
    return false
}
// dfs
func dfs(count: Int) {
    // 정답을 얻는다면 바로 리턴
    if !result.isEmpty {
        return
    }
    // 모든 빈칸을 조건에 맞춰 적었다면 리턴
    if count == blank.count {
        result = board
        return
    }
    // 현재 좌표
    var loc = blank[count]
    // 1부터 9까지 조건에 맞는 숫자를 넣는다.
    for i in 1...9 {
        if !row(loc: loc, num: i) && !col(loc: loc, num: i) && !square(loc: loc, num: i) {
            board[loc.x][loc.y] = i
            dfs(count: count+1)
            board[loc.x][loc.y] = 0
        }
    }
}
dfs(count: 0)

for k in 0..<result.count {
    let ans = result[k].map{String($0)}.joined(separator: " ")
    print(ans)
}

