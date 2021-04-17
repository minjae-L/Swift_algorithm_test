// 문자열 s 는 공백으로 숫자를 구별하고있다. 문자열 s 에 포함되어 있는 숫자의 최솟값과 최댓값을 구해라

func solution(_ s:String) -> String {
    var intArray = [Int]()
    var stringArray = [String]()
    var string = ""
    var result = ""

    for i in s {
        stringArray.append(String(i))
    }

    if s == "" {
        return ""
    } else {
        for i in 0..<stringArray.count {
        if stringArray[i] == " " {
            if let num = Int(string) {
                intArray.append(num)
                string = ""
                continue
            }
        }else if i == stringArray.count - 1 {
                string = string + String(stringArray[i])
                if let num = Int(string) {
                    intArray.append(num)
                    continue
                }
            } else {
                string = string + String(stringArray[i])
            }
        }

        var lowerNum = intArray[0]
        var higgestNum = intArray[0]

        for i in intArray[1..<intArray.count] {
            if  i < lowerNum {
                lowerNum = i
            } else if i > higgestNum {
                higgestNum = i
            }
        }
        result = "\(lowerNum) \(higgestNum)"
        print(intArray)
        return result
    }
}
