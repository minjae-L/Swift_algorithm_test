import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var office = [[Int]]()
var cctvs = [(serial: Int, x: Int, y: Int)]()
var result = Int.max

// cctv의 위치 저장
for i in 0..<N {
    office.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    for j in 0..<office[i].count {
        if office[i][j] != 0 && office[i][j] != 6 {
            cctvs.append((serial: office[i][j], x: i, y: j))
        }
    }
}
// 모든 경우의 수 탐색
func dfs(count: Int, arr: [[Int]]) {
    if count == cctvs.count {
        result = min(result, sum(arr: arr))
        return
    }
    var cctv = cctvs[count]
    // 1번 cctv의 모든방향 탐색 (4가지)
    if cctv.serial == 1 {
        for i in 0..<4 {
            dfs(count: count+1, arr: serial1Range(direction: i, loc: (x: cctv.x, y: cctv.y), arr: arr))
        }
    }
    // 2번 cctv의 모든방향 탐색 (2가지)
    if cctv.serial == 2 {
        for i in 0..<2 {
            dfs(count: count+1, arr: serial2Range(direction: i, loc: (x: cctv.x, y: cctv.y), arr: arr))
        }
    }
    // 3번 cctv의 모든방향 탐색 (4가지)
    if cctv.serial == 3 {
        for i in 0..<4 {
            dfs(count: count+1, arr: serial3Range(direction: i, loc: (x: cctv.x, y: cctv.y), arr: arr))
        }
    }
    // 4번 cctv의 모든방향 탐색 (4가지)
    if cctv.serial == 4 {
        for i in 0..<4 {
            dfs(count: count+1, arr: serial4Range(direction: i, loc: (x: cctv.x, y: cctv.y), arr: arr))
        }
    }
    // 5번 cctv의 모든방향 탐색 (1가지)
    if cctv.serial == 5 {
        dfs(count: count+1, arr: serial5Range( loc: (x: cctv.x, y: cctv.y), arr: arr))
    }
    
}

// 탐색방향 모두 구현
// 오른쪽
func right(loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    for i in loc.y+1..<M {
        if arr[loc.x][i] == 6 { break }
        if arr[loc.x][i] == 0 { arr[loc.x][i] = -1 }
    }
    return arr
}
// 위쪽
func up(loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    for i in (0..<loc.x).reversed() {
        if arr[i][loc.y] == 6 { break }
        if arr[i][loc.y] == 0 { arr[i][loc.y] = -1}
    }
    return arr
}
// 왼쪽
func left(loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    for i in (0..<loc.y).reversed() {
        if arr[loc.x][i] == 6 { break }
        if arr[loc.x][i] == 0 { arr[loc.x][i] = -1 }
    }
    return arr
}
// 아래쪽
func down(loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    for i in loc.x+1..<N {
        if arr[i][loc.y] == 6 { break }
        if arr[i][loc.y] == 0 { arr[i][loc.y] = -1}
    }
    return arr
}

// 1번의 탐색
func serial1Range(direction: Int, loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    // 동
    if direction == 0 {
        return right(loc: loc, arr: arr)
    }
    
    // 서
    if direction == 1 {
        return left(loc: loc, arr: arr)
    }
    
    // 남
    if direction == 2 {
        return down(loc: loc, arr: arr)
    }
    
    // 북
    if direction == 3 {
        return up(loc: loc, arr: arr)
    }
    return arr
}

// 2번의 탐색
func serial2Range(direction: Int, loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    // 가로
    if direction == 0 {
        arr = right(loc: loc, arr: arr)
        arr = left(loc: loc, arr: arr)
    }
    
    // 세로
    if direction == 1 {
        arr = up(loc: loc, arr: arr)
        arr = down(loc: loc, arr: arr)
    }
    return arr
}

// 3번의 탐색
func serial3Range(direction: Int, loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    // 위 오
    if direction == 0 {
        arr = up(loc: loc, arr: arr)
        arr = right(loc: loc, arr: arr)
    }
    // 오 아래
    if direction == 1 {
        arr = right(loc: loc, arr: arr)
        arr = down(loc: loc, arr: arr)
    }
    // 아래 왼
    if direction == 2 {
        arr = down(loc: loc, arr: arr)
        arr = left(loc: loc, arr: arr)
    }
    // 왼 위
    if direction == 3 {
        arr = left(loc: loc, arr: arr)
        arr = up(loc: loc, arr: arr)
    }
    return arr
}

// 4번의 탐색
func serial4Range(direction: Int, loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    // 왼 위 오 (가로 + 위)
    if direction == 0 {
        arr = serial2Range(direction: 0, loc: loc, arr: arr)
        arr = up(loc: loc, arr: arr)
    }
    // 위 오 아래 (세로 + 오)
    if direction == 1 {
        arr = serial2Range(direction: 1, loc: loc, arr: arr)
        arr = right(loc: loc, arr: arr)
    }
    // 오 아래 왼 (가로 + 아래)
    if direction == 2 {
        arr = serial2Range(direction: 0, loc: loc, arr: arr)
        arr = down(loc: loc, arr: arr)
    }
    // 아래 왼 오 (세로 + 왼)
    if direction == 3 {
        arr = serial2Range(direction: 1, loc: loc, arr: arr)
        arr = left(loc: loc, arr: arr)
    }
    return arr
}

// 5번의 탐색
func serial5Range(loc: (x: Int, y: Int), arr: [[Int]]) -> [[Int]] {
    var arr = arr
    arr = serial2Range(direction: 0, loc: loc, arr: arr)
    arr = serial2Range(direction: 1, loc: loc, arr: arr)
    return arr
}

// 사각지대 계산
func sum(arr: [[Int]]) -> Int{
    var sum = 0
    for i in 0..<arr.count {
        sum += arr[i].filter{ $0 == 0}.count
    }
    return sum
}

dfs(count: 0, arr: office)
print(result)
