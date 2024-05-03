import Foundation

// 입력
let N = Int(readLine()!)!
var arr = [[String]]()
arr.append(["0"])
var result = [0,0,0]
for i in 0..<N {
    var a = readLine()!.split(separator: " ").map{String($0)}
    a.insert("0", at: 0)
    arr.append(a)
}

// 분할
func divide(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[String]],_ N: Int) {
    if !check(xs, xe, ys, ye, arr) {
        let m = N/3
        // 9가지로 분할, 해당 분할 위치에따른 재귀호출
        // [1, 2, 3]
        // [4, 5, 6]
        // [7, 8, 9]
        
        // 1
        divide(xs, xs+m-1, ys, ys+m-1, arr, N/3)
        // 2
        divide(xs+m, xs+m*2-1, ys, ys+m-1, arr, N/3)
        // 3
        divide(xs+m*2, xe, ys, ys+m-1, arr, N/3)
        // 4
        divide(xs, xs+m-1, ys+m, ys+m*2-1, arr, N/3)
        // 5
        divide(xs+m, xs+m*2-1, ys+m, ys+m*2-1, arr, N/3)
        // 6
        divide(xs+m*2, xe, ys+m, ys+m*2-1, arr, N/3)
        // 7
        divide(xs, xs+m-1, ys+m*2, ye, arr, N/3)
        // 8
        divide(xs+m, xs+m*2-1, ys+m*2, ye, arr, N/3)
        // 9
        divide(xs+m*2, xe, ys+m*2, ye, arr, N/3)
    }
}

// 같은 원소로 이루어졌는지 확인
func check(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[String]]) -> Bool{
    let val = arr[ys][xs]
    for i in ys...ye {
        for j in xs...xe {
            if val != arr[i][j] { return false }
        }
    }
    // 해당 원소의 따라 다르게 저장
    switch val {
    case "-1": result[0] += 1
    case "0": result[1] += 1
    case "1": result[2] += 1
    default:
        break
    }
    return true
}

// 실행 및 출력
divide(1, N, 1, N, arr, N)
print("\(result[0])\n\(result[1])\n\(result[2])\n")
