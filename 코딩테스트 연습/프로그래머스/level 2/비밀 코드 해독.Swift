import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    let targetArr = Array(1...n)
    var total = 0
    var results = [[Int]]()
    // 조합
    func combi(targetArr: [Int], targetNum: Int, index: Int, arr: [Int]) {
        if arr.count == targetNum {
            results.append(arr)
            return
        }
        for i in index..<targetArr.count {
            combi(targetArr: targetArr, targetNum: targetNum, index: i+1, arr: arr + [targetArr[i]])
        }
    }
    combi(targetArr: targetArr, targetNum: 5, index: 0, arr: [])
    
    // 각 응답값 비교
    results.forEach { element in
        for i in 0..<q.count {
            let arr = q[i]
            if !compare(lhs: arr, rhs: element, correct: ans[i]) {
                break
            }
            if i == q.count-1 {
                total += 1
            }
        }
    }
    return total
}

func compare(lhs: [Int], rhs: [Int], correct: Int) -> Bool {
    var count = 0
    for i in 0..<lhs.count {
        if rhs.contains(lhs[i]) { count += 1}
    }
    if count == correct { return true }
    return false
}
