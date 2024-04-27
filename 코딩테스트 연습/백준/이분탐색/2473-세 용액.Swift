import Foundation

// 입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var minSum = Int.max
var answer = [Int]()
// 이분탐색 사용을위해 정렬
arr.sort(by: <)


// 이분탐색
for i in 0..<N {
    for j in i+1..<N {
        let first = arr[i]
        let second = arr[j]
        let sum = first + second
        var s = j+1
        var e = N-1
        
        while s <= e {
            let m = (s+e)/2
            let total = sum + arr[m]
            if total == 0 {
                answer = [arr[i],arr[j],arr[m]]
                minSum = total
                break
            }
            if total < 0 {
                s = m+1
            } else {
                e = m-1
            }
            if minSum > abs(total) {
                minSum = abs(total)
                answer = [arr[i],arr[j],arr[m]]
            }
        }
        
    }
}

print("\(answer[0]) \(answer[1]) \(answer[2])")
