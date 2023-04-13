func solution(_ msg:String) -> [Int] {
    var dict = [String: Int]()
    var result = [Int]()
    var maxIdx = 26
    var idx = 0
    var msgArr = msg.map{String($0)}
    
    for i in 1...26 {
        dict[String(UnicodeScalar(i+64)!)] = i
    }
    
    while idx < msgArr.count {
        var str = msgArr[idx]
        var prevStr = str
        var i = 0
        var isNewWords = false
        while dict[str] != nil && idx < msgArr.count {
            i += 1
            if idx + i < msgArr.count{
                let nextStr = msgArr[idx+i]
                prevStr = str
                str = str + nextStr
            } else {
                break
            }  
        }
        
        if dict[str] == nil {
            dict[str] = maxIdx + 1
            maxIdx += 1
            result.append(dict[prevStr]!)
        } else {
            result.append(dict[str]!)
        }
        idx += i
        
    }
    
    return result
}
