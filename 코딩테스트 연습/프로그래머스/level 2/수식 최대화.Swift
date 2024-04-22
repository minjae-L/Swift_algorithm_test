import Foundation

func solution(_ expression:String) -> Int64 {
    var operation = ["+", "-", "*"]
    var arr = [String]()
    var oop = [[String]]()
    var num = ""
    var answer = Int.min
    // 우선순위의 모든 경우의수 뽑기
    func combi(_ targetArr: [String],_ arr: [String]) {
        if arr.count == 3 {
            oop.append(arr)
        }
        for i in 0..<targetArr.count {
            if !arr.contains(targetArr[i]) {
                combi(targetArr, arr + [targetArr[i]])
            }
        }
    }
    combi(operation, [])
    
    // 연산자와 피연산자 구분하여 저장
    for i in expression {
        if operation.contains(String(i)) {
            arr.append(num)
            arr.append(String(i))
            num = ""
        } else {
            num += String(i)
        }
    }
    arr.append(num)
    
    // 모든경우의수 탐색하여 최댓값 구하기
    for i in oop {
        var a = arr
        for j in i {
            a = operate(String(j), a)
        }
        answer = max(answer, abs(Int(a[0])!))
    }
    
    return Int64(answer)
}

// 주어진 연산자로 계산
func operate(_ op: String,_ expression: [String]) -> [String] {
    var ex = [String]()
    var index = -1
    for i in 0..<expression.count {
        if i == index {
            index = -1
            continue
        }
        if expression[i] != op {
            ex.append(expression[i])
        } else {
            var n1 = Int(ex.removeLast())!
            var n2 = Int(expression[i+1])!
            switch op {
                case "*":
                ex.append(String(n1 * n2))
                case "-":
                ex.append(String(n1 - n2))
                case "+":
                ex.append(String(n1 + n2))
                default :
                continue
            }
            index = i+1
        }
    }
    return ex
}
