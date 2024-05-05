import Foundation

// 입력
var n = Int(readLine()!)!
let p = 1000000007
// 피보나치 수열을 행렬곱셈으로 구하기
var arr: [[Int]] = [[1,1],[1,0]]

// 행렬 곱셈
func multi(_ x: [[Int]],_ y: [[Int]]) -> [[Int]]{
    var result = Array(repeating: Array(repeating: 0, count: 2), count: 2)
    for i in 0..<2 {
        for j in 0..<2{
            for k in 0..<2 {
                result[i][j] += x[i][k] * y[k][j]
                result[i][j] %= p
            }
        }
    }
    return result
}

// 분할 정복
func divide(_ n: Int) -> [[Int]] {
    // n이 1이면 배열 리턴
    if n == 1 { return arr }
    
    // n이 1이될때까지 분할
    let m = divide(n/2)
    if n % 2 == 0 {
        return multi(m,m)
    } else {
        return multi(multi(m,m), arr)
    }
}
// 출력
print(divide(n)[0][1])
