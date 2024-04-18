import Foundation

// 유클리드를 이용한 gcd 재귀호출
func gcd(_ num1: Int,_ num2: Int) -> Int {
    if num2 == 0 {
        return num1
    } else {
        return gcd(num2, num1 % num2)
    }
}
func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var fA = arrayA[0]
    var fB = arrayB[0]
    
    //A의 최대공약수
    for i in arrayA {
        fA = gcd(fA,i)
    }
    //B의 최대공약수
    for i in arrayB {
        fB = gcd(fB,i)
    }
    // A의 최대공약수로 B를 나눠봄, 나눠지면 0
    for i in arrayB {
        if i % fA == 0 {
            fA = 0
            break
        }
    }
    // B의 최대공약수로 A를 나눠봄, 나눠지면 0
    for i in arrayA {
        if i % fB == 0 {
            fB = 0
            break
        }
    }

    return max(fA, fB)
}
