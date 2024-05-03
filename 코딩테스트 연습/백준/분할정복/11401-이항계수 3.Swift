import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
let p = 1000000007
// 팩토리얼 계산
// 0! = 1이다. 4! = 4 * 3 * 2 * 1 = 4 * 3!으로 나타냄
// 이와같이 1!을 표현하면 1! = 1 * 0!이다. 따라서 0! = 1
func factorial(_ num: Int)-> Int {
    var n = 1
    if num <= 1 { return 1}
    
    for i in 2...num {
        n = n * i % p
    }
    return n
}
// 분할 정복
func divide(_ n: Int,_ k: Int) -> Int{
    // 지수가 1이 되면 값 리턴 (정복)
    if k == 1 { return n % p}
    // 분할
    let m = divide(n, k/2)
    
    // 지수가 1이될때까지 분할한다.
    // 지수가 짝수면 몫*2로 딱 나누어떨어지지만
    // 지수가 홀수면 몫 , 몫+1이 되므로 짝수에서 값을 한번더 곱해준다.
    if k % 2 == 0 {
        return m*m%p
    } else {
        return (m*m%p)*n%p
    }
    
}
// 출력
print(factorial(N) * divide(factorial(N-K) * factorial(K) % p, p-2) % p)
