import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
var robotLoc = (x: input2[0], y: input2[1])
var dir = input2[2]
var room = [[Int]]()
var count = 0
for i in 0..<N {
    room.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 탈출조건이 만족할때 까지 청소
while true {
    if !find(loc: &robotLoc, dir: &dir) {
        break
    }
}
// 청소된 방의 구역수를 세고 출력
for i in 0..<room.count {
    count += room[i].filter{ $0 == -1}.count
}
print(count)

// 구역 청소
func cleaning(loc: (x: Int, y: Int)) {
    if room[loc.x][loc.y] == 0 {
        room[loc.x][loc.y] = -1
    }
}

// 인접한 4개의 구역 확인
func find(loc: inout (x: Int, y: Int), dir: inout Int) -> Bool{
    // 4개 구역 임의의 수입력
    var upp = -2, rightp = -2, downp = -2, leftp = -2
    // 청소할수 없다 (벽이거나 이미 청소된곳)
    var cant = [1,-1]
    // 처음에 주어지는 위치는 청소되지않는곳으로 부여되므로 일단 청소
    cleaning(loc: loc)
    
    // 주어진 위치의 상 하 좌 우 위치를 구한다.
    // 인덱스 범위를 넘어도 벽(1) 로 설정
    if loc.x-1 >= 0 {
        upp = room[loc.x-1][loc.y]
    } else { upp = 1 }
    
    if loc.y+1 < M {
        rightp = room[loc.x][loc.y+1]
    } else { rightp = 1 }
    
    if loc.x+1 < N {
        downp = room[loc.x+1][loc.y]
    } else { downp = 1 }
    
    if loc.y-1 >= 0 {
        leftp = room[loc.x][loc.y-1]
    } else { leftp = 1 }
    
    // 4개 인접한 구역이 청소할 수 없는경우(이미청소됬거나, 벽인 경우)
    if cant.contains(upp) && cant.contains(downp) && cant.contains(leftp) && cant.contains(rightp) {
        // 방향에 따라 후진한다.
        // 후진 할 수 없는경우 로봇의 작동 멈춤
        if dir == 0 {
            if downp == 1 {
                return false
            } else {
                loc.x += 1
                return true
            }
        }
        if dir == 1 {
            if leftp == 1 {
                return false
            } else {
                loc.y -= 1
                return true
            }
        }
        if dir == 2 {
            if upp == 1 {
                return false
            } else {
                loc.x -= 1
                return true
            }
        }
        if dir == 3 {
            if rightp == 1 {
                return false
            } else {
                loc.y += 1
                return true
            }
        }
    } else {
        // 4군데중 청소할 곳이 있는경우
        // 방향에 따라 위치로 이동하고 청소
        dir -= 1
        if dir == -1 {
            dir = 3
        }
        if dir == 0 {
            if upp == 0 {
                loc.x -= 1
                cleaning(loc: loc)
            }
        } else if dir == 1 {
            if rightp == 0 {
                loc.y += 1
                cleaning(loc: loc)
            }
        } else if dir == 2 {
            if downp == 0 {
                loc.x += 1
                cleaning(loc: loc)
            }
        }else {
            if leftp == 0 {
                loc.y -= 1
                cleaning(loc: loc)
            }
        }
        return true
    }
    return true
}
