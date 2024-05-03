import Foundation

// 입력
let N = Int(readLine()!)!
var arr = [[Character]]()
arr.append(["0"])
for i in 0..<N {
    var a = Array(readLine()!)
    a.insert("0", at: 0)
    arr.append(a)
}

// 분할
func divide(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[Character]]) -> String {
    var s = "\(arr[ys][xs])"
    // 같은원소로 이루어지지 않았다면 4등분
    if !check(xs,xe,ys,ye,arr) {
        let xm = (xs+xe)/2
        let ym = (ys+ye)/2
        // 압축하는과정이므로 괄호로 감싼다.
        s = "(\(divide(xs, xm, ys, ym, arr))\(divide(xm+1, xe, ys, ym, arr))\(divide(xs, xm, ym+1, ye, arr))\(divide(xm+1, xe, ym+1, ye, arr)))"
    }
    // 같은 원소로 이루어졌다면 배열의 왼쪽위 원소 출력
    return s
}

// 해당 NxN배열이 모두 같은원소로 이루어졌는지 확인
func check(_ xs: Int,_ xe: Int,_ ys: Int,_ ye: Int,_ arr: [[Character]]) -> Bool {
    let color = arr[ys][xs]
    for i in ys...ye {
        for j in xs...xe {
            if color != arr[i][j] { return false }
        }
    }
    return true
}
print(divide(1, N, 1, N, arr))
