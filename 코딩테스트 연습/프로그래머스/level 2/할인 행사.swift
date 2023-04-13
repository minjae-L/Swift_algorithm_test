import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var count = number.reduce(0, +)
    var dict = [String: Int]()
    var result = [Int]()
    
    for i in 0..<want.count {
        dict[want[i]] = i
    }
    
    for i in 0...discount.count - count {
        var arr = discount[i..<i+count].map{ dict[$0]}
        var check = Array(repeating: 0, count: want.count)

        if arr.contains(nil) {
            continue
        } else {
            for i in arr {
                check[i!] += 1
            }
            if check == number {
                result.append(i+1)
            }
        }
    }
    return result.count
}
