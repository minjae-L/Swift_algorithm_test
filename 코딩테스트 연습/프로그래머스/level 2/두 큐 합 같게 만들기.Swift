import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = queue1
    var q2 = queue2
    var q1Idx = 0
    var q2Idx = 0
    var sumQ1 = q1.reduce(0, +)
    var sumQ2 = q2.reduce(0, +)
    var result = 0

    for i in 0..<queue1.count * 3 {
        var num = 0
        if sumQ1 > sumQ2 {
            num = q1[q1Idx]
            q1[q1Idx] = 0
            q1Idx += 1
            sumQ1 -= num
            sumQ2 += num
            q2.append(num)
        } else if sumQ2 > sumQ1 {
            num = q2[q2Idx]
            q2[q2Idx] = 0
            q2Idx += 1
            sumQ2 -= num
            sumQ1 += num
            q1.append(num)
        } else {
            return result
        }
        result += 1
    }
    
    return -1
}
