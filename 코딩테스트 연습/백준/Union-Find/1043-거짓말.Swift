import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
let know = readLine()!.split(separator: " ").map{Int(String($0))!}
var parent = Array(repeating: 0, count: N+1)
var party = [[Int]]()
var count = 0

// 분리집합
for i in 1...N {
    parent[i] = i
}

// 분리집합끼리 연결한다.
func union(_ x: Int,_ y: Int) {
    let rootX = findd(x)
    let rootY = findd(y)
    
    parent[rootY] = rootX
}

// 해당 원소의 루트노드를 찾는다.
func findd(_ x: Int) -> Int {
    if parent[x] == x { return x}
    parent[x] = findd(parent[x])
    
    return parent[x]
}

// 거짓말을 아는사람이 있는경우 루트0으로 연결
if know[0] != 0 {
    for i in 1..<know.count {
        union(0, know[i])
    }
}

// party 수만큼 입력받기
for i in 0..<M {
    party.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 매 파티마다 거짓말을 아는인원과 모르는인원이 공존하지 않을때 까지 반복한다.
var find = true
while find {
    find = false
    var inLiar = false
    for i in 0..<party.count {
        var previous = -1
        for j in 1..<party[i].count {
            let root = findd(party[i][j])
            // 처음 사람이면 previos 초기화
            if previous == -1 {
                previous = root
                continue
            }
            // 그 다음인원이 거짓말을 알고, 이전인원이 모르는경우
            if (root != previous && root == 0 ){
                inLiar = true
                break
            }
            // 그 다음인원이 거짓말을 모르고, 이전인원이 아는 경우
            if (previous == 0 && root != 0 ) {
                inLiar = true
                break
            }
            previous = root
        }
        // 파티안에 거짓말을 아는사람과 모르는사람이 공존한다면 모두 거짓말을 아는사람으로 바꾼다.(Union)
        if inLiar {
            find = true
            for j in 1..<party[i].count {
                union(0, party[i][j])
            }
        }
        inLiar = false
    }
}

// 완전히 갱신된 파티에서 거짓말을 할 수 있는지 파악
for i in 0..<party.count {
    var liar = false
    for j in 1..<party[i].count {
        if findd(party[i][j]) == 0 {
            liar = true
            break
        }
    }
    if !liar { count += 1}
}

print(count)
