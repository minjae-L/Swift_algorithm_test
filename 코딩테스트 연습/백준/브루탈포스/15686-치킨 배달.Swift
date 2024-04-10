import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var house = [(x: Int, y: Int)]()
var chickenHouse = [(x: Int, y: Int)]()
var chickenDistance = Int.max

// 치킨집과 집 좌표를 구해서 저장한다. 좌표는 1부터 시작
for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<input.count {
        if input[j] == 1 {
            house.append((x: i, y: j+1))
        }
        if input[j] == 2 {
            chickenHouse.append((x: i, y: j+1))
        }
    }
}

// 조합, 원하는 갯수만큼 뽑았다면 치킨거리 계산하기
func combi(_ targetArr: [(x: Int, y: Int)],_ targetNum: Int,_ index: Int, arr: [(x: Int, y: Int)]) {
    if arr.count == targetNum {
        carculateChickenDistance(arr)
        return
    }
    
    for i in index..<targetArr.count {
        combi(targetArr, targetNum, i+1, arr: arr + [targetArr[i]])
    }
}

// 치킨거리 계산 후 최솟값 갱신
func carculateChickenDistance(_ arr: [(x: Int, y: Int)]) {
    var distance = [Int]()
    
    for i in 0..<house.count {
        var result = [Int]()
        for j in 0..<arr.count {
            result.append(abs(house[i].x - arr[j].x) + abs(house[i].y - arr[j].y))
        }
        distance.append(result.min()!)
    }
    chickenDistance = min(chickenDistance, distance.reduce(0, +))
}


for i in 1...M {
    combi(chickenHouse, i, 0, arr: [])
}
print(chickenDistance)
