import Foundation

var inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var n = inputs[0]
var setPrice = [Int]()
var singlePrice = [Int]()
var result = 0

// 기타 브랜드별 패키지 가격과 낱개 가격 입력
for i in 0..<inputs[1] {
    var prices = readLine()!.split(separator: " ").map{ Int($0)! }
    setPrice.append(prices[0])
    singlePrice.append(prices[1])
}

// 패키지 기준으로 끊어진 줄의 갯수를 구매할때 최솟값 구하기
// 끊어진 줄의 갯수가 6개 이상일때 패키지와 낱개를 6개 구매한 가격을 비교
// 줄이 남아도 상관없으니 6개이하일때도 패키지와 낱개를 남은 줄만큼 구매한 가격을 비교
while n > 0 {
    var arr : [Int] = []
    if n >= 6 {
        arr = setPrice + singlePrice.map{ $0 * 6}
        result += arr.min()!
        n -= 6
    } else {
        arr = setPrice + singlePrice.map{ $0 * n}
        result += arr.min()!
        n -= n
    }
}
print(result)
