import Foundation

// 입력받기
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], B = input[1]
var arr = [[Int]]()
for i in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 분할 정복
func divide(_ N: [[Int]],_ B: Int) -> [[Int]]{
    // 지수가 1이 될때 까지 분할
    if B == 1 {
        return N
    }
    // 지수를 반으로 분할
    let m = divide(N, B/2)
    // 지수가 짝수인경우 나머지가 없으므로 나눈 두 행렬을 곱
    if B % 2 == 0 {
        return multi(m, m)
    } else {
        // 지수가 홀수라면 나머지1이 존재하므로 나눈 두 행렬과 지수가 1인 행렬 곱
        return multi(multi(m, m), N)
    }
}
//행렬 곱
func multi(_ x: [[Int]],_ y: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            for k in 0..<N {
                result[i][j] += ((x[i][k] * y[k][j]))
            }
            result[i][j] %= 1000
        }
    }
    return result
}

// 지수가 1이고, 행렬의 원소가 1000 이상이라면 출력은 해당원소를 1000으로 나눠야 하므로 한번 나눠준다.
var result = divide(arr, B)
for i in 0..<result.count {
    for j in 0..<result[i].count {
        result[i][j] %= 1000
    }
}

// 출력
for i in 0..<result.count {
    print(result[i].map{String($0)}.joined(separator: " "))
}

