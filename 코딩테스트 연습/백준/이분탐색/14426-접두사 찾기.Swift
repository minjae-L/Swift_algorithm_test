import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var S = [String]()
var count = 0
for i in 0..<N {
    S.append(readLine()!)
}
// 이분탐색을 위해 정렬한다.
S.sort{$0 < $1}

for i in 0..<M {
    let str = readLine()!
    var start = 0, end = S.count - 1
    var mid = 0
    var compare = ""
    // 이분탐색하여 주어진 문자열과 집합S중에서 크기가 비슷한(접두사가 있을 가능성이 높은) 문자를 뽑는다.
    while start < end {
        mid = (start+end)/2
        if S[mid] < str {
            start = mid + 1
        } else {
            end = mid
        }
    }
    compare = S[end]
    // 접두사가 있다면 더해준다.
    if compare.hasPrefix(str) {
        count += 1
    }
    
}
print(count)
