import Foundation

func combi (_ strs: [String], _ count: Int) -> [[String]] {
    var result = [[String]]()
    
    func combination(_ index: Int, _ nowCombi: [String]) {
        if nowCombi.count == count {
            result.append(nowCombi)
            return
        }
        for i in index..<strs.count {
            combination(i+1, nowCombi + [strs[i]])
        }
    }
    combination(0, [])
    
    return result
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    
    for i in course {
        var dict = [String: Int]()
        var count = i
        
        for j in orders {
            var arr = String(j).map{String($0)}
            var combiArr = combi(arr, count)
            for k in combiArr {
                var str = k.sorted{$0 < $1}.joined(separator: "")
                if dict[str] == nil {
                    dict[str] = 1
                } else {
                    dict[str]! += 1
                }
            }  
        }
        
        var sortedDict = dict.sorted{ $0.value > $1.value}
        
        if dict.values.max() == nil {
            continue
        } else {
            for (key, value) in sortedDict {
                if value == dict.values.max()! && value != 1 {
                    result.append(key)
                } else {
                    break
                }
            }
        }
    }
    return result.sorted{ $0 < $1}
}
