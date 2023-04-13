import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var dict = [String: [String]]()
    var resultDict = [String: Int]()
    var resultArr = [Int]()
    
    for i in records {
        var arr = i.split(separator: " ").map{String($0)}
        if dict[arr[1]] == nil {
            dict[arr[1]] = [arr[0], arr[2]]
        } else {
            dict[arr[1]]! += [arr[0], arr[2]]
        }
    }
    
    for i in dict {
        var arr = i.value
        var sum = 0
        for j in 0..<arr.count / 2 {
            var idx = j * 2
            var strArr = arr[idx].split(separator: ":").map{Int(String($0))!}
            var num = strArr[0] * 60 + strArr[1]
            if arr[idx+1] == "IN" {
                sum -= num
                if idx+2 == arr.count {
                    sum += 1439
                }
            } else {
                sum += num
            }
        }
        resultDict[i.key] = sum
        
    }
    
    for i in resultDict.sorted{$0.key < $1.key} {
        var sum = fees[1]
        if i.value <= fees[0] {
            resultArr.append(sum)
        } else {
            sum = sum + (Int(ceil(Double(i.value - fees[0]) / Double(fees[2]))) * fees[3])
            resultArr.append(sum)
        }
    }
    
    return resultArr
}
