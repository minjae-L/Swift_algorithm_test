import Foundation

// 입력받기
let N = Int(readLine()!)!
var count = 0
var board = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
let K = Int(readLine()!)!
for i in 0..<K {
    let loc = readLine()!.split(separator: " ").map{Int(String($0))!}
    board[loc[0]][loc[1]] = 1
}

let L = Int(readLine()!)!
var moves = [Int: String]()
for i in 0..<L {
    let m = readLine()!.split(separator: " ").map{String($0)}
    moves[Int(m[0])!] = m[1]
}

// 뱀의 현위치와 방향배열
var snake = [(x: 1, y: 1)]
var d = ["r", "d", "l", "u"]
var di = 0

// 뱀의 위치를 큐 형식(FIFO)으로 위치를 갱신한다.
while true {
    count += 1
    
    let loc = snake.last!
    var moved: (x: Int, y: Int) = (x: 0, y: 0)
    switch d[di] {
    case "r":
        moved = (x: loc.x + 1, y: loc.y)
    case "d":
        moved = (x: loc.x, y: loc.y + 1)
    case "l":
        moved = (x: loc.x - 1, y: loc.y)
    case "u":
        moved = (x: loc.x, y: loc.y - 1)
    default:
        continue
    }
    
    // 뱀이 벽에 부딪히거나 자신의 몸을 부딪히면 끝
    if moved.x < 1 || moved.x >= N+1 || moved.y < 1 || moved.y >= N+1 {
        break
    }
    if snake.contains(where: { $0.x == moved.x && $0.y == moved.y }) {
        break
    }
    
    if board[moved.y][moved.x] != 1 {
        snake.removeFirst()
    } else {
        board[moved.y][moved.x] = 0
    }
    snake.append(moved)
    // 방향전환
    if moves[count] != nil {
        let changeDirect = moves[count]!
        if changeDirect == "D" {
            di += 1
        } else if changeDirect == "L" {
            di -= 1
        }
    }
    if di >= d.count {
        di = 0
    } else if di < 0 {
        di = d.count - 1
    }
}

print(count)
