import Foundation

func solution(_ p:String) -> String {
    return correctSameString(p)
}

// 전체적인 동작
func correctSameString(_ str: String) -> String {
    // 올바른문자열이라면 재귀 탈출
    if isCorrectString(str) {
        return str
    } else {
        var arr = divideString(s: str)
        // 분리한 문자열 u가 올바른 문자열이면 v는 다시 재귀호출
        if isCorrectString(arr[0]) {
            return "\(arr[0])" + "\(correctSameString(arr[1]))"
        } else {
            // 분리한 문자열 u가 올바른 문자열이 아니라면, v는 재귀호출하고, (v)u 형식으로 출력
            var s = ""
            var cs = ""
            var sarr = arr[0]
            // u문자열의 앞뒤 자르기
            if sarr.count != 0 {
                s = String(sarr.prefix(sarr.count-1))
                s.remove(at: s.startIndex)
            }
            // u문자열 뒤집기
            for i in s {
                if i == "(" {
                    cs += ")"
                } else {
                    cs += "("
                }
            }
            // 형식에 맞게 재귀호출
            return "(" + correctSameString(arr[1]) + ")" + "\(cs)"
        }
    }
}

// 문자열을 두개의 올바른 괄호문자열로 나눈다.
func divideString(s: String) -> [String] {
    var str = s
    var leftStr = ""
    var rightStr = ""
    for i in 1...str.count/2 {
        var index = i * 2
        leftStr = String(str.prefix(index))
        rightStr = String(str.suffix(str.count - index))
        if isSameCountString(leftStr) && isSameCountString(rightStr) {
            return [leftStr, rightStr]
        }
    }
    return [leftStr, rightStr]
}

// 균형잡힌 문자열인지 판단
func isSameCountString(_ p: String) -> Bool {
    var str = p
    var count = 0
    for i in str {
        if i == "(" {
            count += 1
        } else if i == ")" {
            count -= 1
        }
    }
    
    if count != 0 {
        return false
    } else {
        return true
    }
}

// 올바른 문자열인지 판단
func isCorrectString(_ p: String) -> Bool {
    var stack = [String]()
    for i in p {
        switch i {
            case "(":
            stack.append("(")
            case ")":
            if !stack.isEmpty {
                stack.removeLast()
            }
            default:
            continue
        }
    }
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}
