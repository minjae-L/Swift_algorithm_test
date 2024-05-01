import Foundation

// 입력받기
let N = Int(readLine()!)!
var dict = [Int: Int]()
var arr = [Int]()

// 수를 배열및 딕셔너리에 저장
for i in 0..<N {
    let n = Int(readLine()!)!
    arr.append(n)
    if dict[n] == nil {
        dict[n] = 1
    } else {
        dict[n]! += 1
    }
}
// 정렬
// 딕셔너리는 최빈값을 구하기 위해 정렬하고, 빈도수가 같은 수는 오름차순한다.
arr.sort{$0 < $1}
var sorted = dict.sorted{ if $0.value == $1.value {
    return $0.key < $1.key } else {
        return $0.value > $1.value
    }}

// 산술평균과 중앙값 출력
var sum: Double = Double(arr.reduce(0, +))
print(Int(round(sum/Double(N))))
print(arr[N/2])

//최빈값 출력
var previous: (key: Int, value: Int)? = nil
var most = 0
if sorted.count == 1 {
    most = sorted[0].key
} else {
    for (key, value) in sorted {
        if previous == nil {
            previous = (key: key, value: value)
            continue
        }
        if previous!.value > value {
            most = previous!.key
        } else if previous!.value == value {
            most = key
        }
        break
    }
}
print(most)
//범위 출력
print(abs(arr.max()! - arr.min()!))
