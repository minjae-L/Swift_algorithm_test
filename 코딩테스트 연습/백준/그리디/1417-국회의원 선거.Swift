import Foundation

// 입력
var N = Int(readLine()!)!
var arr = [Int]()
var cnt = 0

// 후보 입력
for i in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 다솜
var ds = arr[0]
arr.removeFirst()
arr.sort { $0 > $1 }

// 후보를 다득표순으로 정렬후, 맨 첫번째 원소가 다솜보다 작을때까지 매수한다.
while !arr.isEmpty && arr[0] >= ds {
    cnt += 1
    ds += 1
    arr[0] -= 1
    arr.sort { $0 > $1 }
}

print(cnt)
