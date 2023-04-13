func solution(_ files:[String]) -> [String] {
    var dict = [String: [String]]()
    var result = [String]()
    var idx = 0
    for i in files {
        var arr = i.map{ String($0)}
        var head = [String]()
        var number = [String]()
        
        var headEnd = false
        var numEnd = false
        
        for j in 0..<arr.count {
            if !headEnd {
                if Int(arr[j]) == nil {
                    head.append(arr[j])
                } else {
                    number.append(arr[j])
                    headEnd = true
                }
            } else if !numEnd {
                if Int(arr[j]) != nil {
                    number.append(arr[j])
                } else {
                    break
                }
            }
        }
        dict[String(i)] = [head.joined(separator: ""), number.joined(separator: ""), String(idx)]
        idx += 1
    }
    var sortedDict = dict.sorted{if $0.value[0].uppercased() == $1.value[0].uppercased() {
        if Int($0.value[1]) == Int($1.value[1]) {
            return Int($0.value[2])! < Int($1.value[2])!
        } else {
            return Int($0.value[1])! < Int($1.value[1])!
        }
    } else { return $0.value[0].uppercased() < $1.value[0].uppercased() }}
    for i in sortedDict {
        result.append(i.key)
    }

    return result
}
