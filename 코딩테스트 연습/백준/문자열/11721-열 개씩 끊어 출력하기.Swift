import Foundation

var str = readLine()!.map{ String($0)}
var result = ""
for i in 0..<str.count {
    result += str[i]
    if result.count == 10 {
        print(result)
        result = ""
    }
    if i == str.count - 1 {
        print(result)
    }
}

