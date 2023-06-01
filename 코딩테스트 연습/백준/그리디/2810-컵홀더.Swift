import Foundation

let count = Int(readLine()!)!
var sit = Array(readLine()!).map{ String($0)}
var set = ["*"]
var idx = 0
var result = 0

// 주어진 문자열을 컵홀더위치까지 넣어준다.
while idx < sit.count {
    if sit[idx] == "S" {
        set.append(sit[idx])
        set.append("*")
        idx += 1
    } else {
        set.append(sit[idx])
        set.append(sit[idx+1])
        set.append("*")
        idx += 2
    }
}
idx = 0

// 컵홀더까지 포함된 문자열에서 두개씩 쌍으로 추출하여 좌석과 컵홀더로 존재하면 카운트
// 커플석과같이 L L 이 추출되면 한칸 건너뛰어서 재추출한다.
while idx < set.count - 1 {
    var s1 = set[idx]
    var s2 = set[idx+1]
    if s1 == "*" || s2 == "*" {
        result += 1
        idx += 2
    } else {
        idx += 1
    }
}

print(result)
