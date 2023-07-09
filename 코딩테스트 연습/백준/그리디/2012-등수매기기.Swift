import Foundation

// 입력
let N = Int(readLine()!)!
var arr = [Int]()
var sum = 0

// 예상등수 입력
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 내림차순 정렬
arr.sort{ $0 > $1}

// 예상등수와 차이가 가장 적은 값과 결합하여 불만도를 최소로 한다.
for i in 1...N {
    var num = abs(arr.removeLast() - i)
    sum += num
}
print(sum)
