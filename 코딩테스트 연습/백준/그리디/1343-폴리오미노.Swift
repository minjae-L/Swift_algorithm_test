import Foundation

var input = readLine()!
var arr = input.map{ String($0)}
var result = [String]()
var idx = 0

// 폴리오미노 덮기
// AAAA로 바꿀수 있다면 최대한 바꿔준다.
// 폴리오미노 둘다 길이가 2로 나눠지므로 만약 2로 나눠지지 않는다면 덮을 수 없다고 판단한다.
while idx < arr.count {
    if arr[idx] == "." {
        result.append(arr[idx])
        idx += 1
        continue
    }
    var count = 0
    while idx < arr.count && arr[idx] == "X" {
        count += 1
        idx += 1
    }
    while count > 0 {
        if count % 2 != 0 {
            result = ["-1"]
            break
        } else if count >= 4 {
            count -= 4
            result.append("AAAA")
        } else {
            count -= 2
            result.append("BB")
        }
    }
}
if result.contains("-1") {
    print("-1")
} else {
    print(result.joined(separator: ""))
}
