import Foundation

// 테스트케이스 개수
let cc = Int(readLine()!)!

for i in 0..<cc {
    let count = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{ UInt64($0)! }
    var max: UInt64 = 0
    var result: UInt64 = 0
    
    // 역순으로 주가의 최고가보다 전날이 적으면 차익을 계속 더해준다.
    for j in (0..<count).reversed() {
        if arr[j] > max {
            max = arr[j]
        } else {
            result += (max - arr[j])
        }
    }
    print(result)
}
