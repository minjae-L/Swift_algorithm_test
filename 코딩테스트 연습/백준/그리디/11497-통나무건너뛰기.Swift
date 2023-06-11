import Foundation

// 테스트케이스 수
let c = Int(readLine()!)!

for i in 0..<c {
    // 주어진 통나무 수 와 높이 배열 입력
    let count = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{ Int($0)! }
    
    // 오름차순
    var sortedArr = arr.sorted{$0 < $1}
    
    // 배열 정렬
    var max = sortedArr.removeLast()
    var arr1 = [Int]()
    var arr2 = Array(repeating: 0, count: sortedArr.count / 2)
    var idx = 0
    while idx < sortedArr.count {
        if idx+1 == sortedArr.count {
            arr1.append(sortedArr[idx])
            idx += 1
        } else {
            arr1.append(sortedArr[idx])
            arr2[arr2.count-1-(idx/2)] = sortedArr[idx+1]
            idx += 2
        }
    }
    arr1.append(max)
    var r = arr1 + arr2
    
    // 인접한 통나무의 높이차이를 비교하여 가장 큰 차이를 저장
    var min = -1
    for j in 0..<r.count {
        var num = Int()
        if j == r.count - 1 {
            num = r[j] - r[0]
        } else {
            num = r[j] - r[j+1]
        }
        if min < abs(num) { min = abs(num) }
    }
    print(min)
}
