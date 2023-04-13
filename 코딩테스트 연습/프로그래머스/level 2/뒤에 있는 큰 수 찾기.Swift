import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var arr = [Int]()
    var result = [Int]()
    var num = 0
    
    for i in numbers.reversed() {
        if arr.count == 0 {
            arr.append(i)
            result.append(-1)
        } else {
            num = arr.popLast()!
            while num <= i && arr.count > 0 {
                num = arr.popLast()!
            }
            if num > i {
                result.append(num)
                arr.append(num)
                arr.append(i)
            } else {
                if arr.count == 0 {
                    result.append(-1)
                    arr.append(i)
                }
            }
        }
        
    }

    return result.reversed()
}
