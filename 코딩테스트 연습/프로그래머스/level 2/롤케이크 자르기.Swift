import Foundation

func solution(_ topping:[Int]) -> Int {
    var result = 0
    var arr = topping
    var set1 = Set<Int>()
    var dict = [Int: Int]()
    for i in 0..<topping.count {
        if dict[topping[i]] == nil {
            dict[topping[i]] = 1
        } else {
            dict[topping[i]]! += 1
        }
    }
    for i in 0..<topping.count {
        set1.insert(topping[i])
        dict[topping[i]]! -= 1
        if dict[topping[i]]! == 0 {
            dict[topping[i]] = nil
        }
        if set1.count == dict.count {
            result += 1
        }
    }

    return result
}
