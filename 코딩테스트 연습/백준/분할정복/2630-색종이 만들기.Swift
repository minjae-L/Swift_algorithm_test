import Foundation

// 입력
let N = Int(readLine()!)!
var arr = [[Int]]()
var white = 0
var blue = 0
arr.append([0])
for i in 0..<N {
    var a = readLine()!.split(separator: " ").map{Int(String($0))!}
    a.insert(0, at: 0)
    arr.append(a)
}

// 분할정복
func dividePaper(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[Int]]) {
    // 종이가 완전히 같은색이 아니면 4등분으로 분할
    if !checkPaper(xs,xe,ys,ye,arr) {
        let xmid = (xs+xe)/2
        let ymid = (ys+ye)/2
        dividePaper(xs, xmid ,ys ,ymid ,arr)
        dividePaper(xmid+1, xe ,ys ,ymid ,arr)
        dividePaper(xs, xmid, ymid+1, ye, arr)
        dividePaper(xmid+1, xe, ymid+1, ye, arr)
    }
}

// 종이가 모두 같은색으로 되있는지 확인
func checkPaper(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[Int]]) -> Bool {
    let color = arr[ys][xs]
    for i in ys...ye {
        for j in xs...xe {
            if color != arr[i][j] {
                return false
            }
        }
    }
    if color == 0 {
        white += 1
    } else {
        blue += 1
    }
    return true
}

dividePaper(1, N, 1, N, arr)
print(white)
print(blue)
