import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var num = n
    var numString = ""
    var changeKnum = [String]()
    var result = 0
    
    if k == 10 {
        numString = String(num)
    } else {
        while num >= 1 {
            changeKnum.append(String(num % k))
            num = num / k
        }
        numString = changeKnum.reversed().joined(separator: "")
    }
    var arr = numString.split(separator: "0").map{Int($0)!}
    for i in arr {
        var checkNum = Int(i)
        if checkNum == 1 {
            continue
        } else {
            var rangeNum = 1
            var isntPrime = false
            while rangeNum * rangeNum <= checkNum {
                if rangeNum == 1 {
                    rangeNum += 1
                    continue
                }
                if checkNum % rangeNum == 0 {
                    isntPrime = true
                    break
                }
                rangeNum += 1
            }
            if !isntPrime {
                result += 1
            }
        }

    }
 
    return result
}
