import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var paper = [[Int]]()
var maxNum = Int.min
for i in 0..<N {
    paper.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 첫번째 테트로미노 경우의수
func poly1(x: Int, y: Int) {
    var sum = 0
    if x+3 >= M && y+3 >= N { return }
    if x+3 >= M {
        sum = paper[y][x] + paper[y+1][x] + paper[y+2][x] + paper[y+3][x]
        maxNum = max(maxNum, sum)
    } else if y+3 >= N {
        sum = paper[y][x] + paper[y][x+1] + paper[y][x+2] + paper[y][x+3]
        maxNum = max(maxNum, sum)
    } else {
        sum = paper[y][x] + paper[y+1][x] + paper[y+2][x] + paper[y+3][x]
        maxNum = max(maxNum, sum)
        sum = paper[y][x] + paper[y][x+1] + paper[y][x+2] + paper[y][x+3]
        maxNum = max(maxNum, sum)
    }
}

// 두번째 테트로미노 경우의수
func poly2(x: Int, y: Int) {
    var sum = 0
    if x+1 >= M || y+1 >= N { return }
    sum = paper[y][x] + paper[y+1][x] + paper[y][x+1] + paper[y+1][x+1]
    maxNum = max(maxNum, sum)
}

// 세번째 테트로미노 경우의수
func poly3(x: Int, y: Int) {
    var sum = 0
    if y-2 >= 0 {
        sum = paper[y][x] + paper[y-1][x] + paper[y-2][x]
        if x+1 < M {
            maxNum = max(maxNum, sum + paper[y][x+1])
        }
        if x-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y][x-1])
        }
    }
    if x+2 < M {
        sum = paper[y][x] + paper[y][x+1] + paper[y][x+2]
        if y+1 < N {
            maxNum = max(maxNum, sum + paper[y+1][x])
        }
        if y-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y-1][x])
        }
    }
    if y+2 < N {
        sum = paper[y][x] + paper[y+1][x] + paper[y+2][x]
        if x+1 < M {
            maxNum = max(maxNum, sum + paper[y][x+1])
        }
        if x-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y][x-1])
        }
    }
    if x-2 >= 0 {
        sum = paper[y][x] + paper[y][x-1] + paper[y][x-2]
        if y+1 < N {
            maxNum = max(maxNum, sum + paper[y+1][x])
        }
        if y-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y-1][x])
        }
    }
}

// 네번째 테트로미노 경우의수
func poly4(x: Int, y: Int) {
    var sum = 0
    if y-1 >= 0 {
        sum = paper[y][x] + paper[y-1][x]
        if x+1 < M && y+1 < N {
            maxNum = max(maxNum, sum + paper[y][x+1] + paper[y+1][x+1])
        }
        if x-1 >= 0 && y+1 < N {
            maxNum = max(maxNum, sum + paper[y][x-1] + paper[y+1][x-1])
        }
    }
    if x+1 < M {
        sum = paper[y][x] + paper[y][x+1]
        if y+1 < N && x-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y+1][x] + paper[y+1][x-1])
        }
        if y-1 >= 0 && x-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y-1][x] + paper[y-1][x-1])
        }
    }
}

// 다섯번째 테트로미노 경우의수
func poly5(x: Int, y:Int) {
    var sum = 0
    if x-1 >= 0 && x+1 < M {
        sum = paper[y][x-1] + paper[y][x] + paper[y][x+1]
        if y+1 < N {
            maxNum = max(maxNum, sum + paper[y+1][x])
        }
        if y-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y-1][x])
        }
    }
    if y-1 >= 0 && y+1 < N {
        sum = paper[y-1][x] + paper[y][x] + paper[y+1][x]
        if x+1 < M {
            maxNum = max(maxNum, sum + paper[y][x+1])
        }
        if x-1 >= 0 {
            maxNum = max(maxNum, sum + paper[y][x-1])
        }
    }
}

// 주어진 종이에서 기준점을 기준으로 모든 테트로미노 모형 경우의수를 따지고 최댓값을 구한다.
for i in 0..<N {
    for j in 0..<M {
        poly1(x: j, y: i)
        poly2(x: j, y: i)
        poly3(x: j, y: i)
        poly4(x: j, y: i)
        poly5(x: j, y: i)
    }
}

print(maxNum)
