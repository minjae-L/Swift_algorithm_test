import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var numArr = numbers
    
    
    if target == 0 && numArr.count == 0 {
        return 1
    }else if numArr.count == 0 {
        return 0
    }
    var num = numArr.removeFirst()
    return solution(numArr, target + num) + solution(numArr, target - num)
}
