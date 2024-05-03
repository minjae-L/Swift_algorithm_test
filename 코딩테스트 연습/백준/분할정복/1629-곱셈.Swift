import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var A = input[0], B = input[1], C = input[2]

// 분할 정복
func mul(_ n: Int,_ c: Int,_ d: Int) -> Int {
    
    // c가 1이될때까지 분할하고, 1이됬다면 정복과정을 진행한다.
    if c == 1 { return n%d}
    
    // 지수법칙을 이용하여 c/2번 곱한 나머지를 구한다.
    let m = mul(n, c/2, d)
    
    // c가 짝수라면 곱해주고,
    // c가 홀수라면 c = 5 -> n^2 * n^2 * n^1
    // n을 한번곱한 나머지를 추가로 곱해준다.(분배법칙)
    if c % 2 == 0{
        return m*m%d
    } else {
        return m*m%d*n%d
    }
    
}
print(mul(A, B, C))
