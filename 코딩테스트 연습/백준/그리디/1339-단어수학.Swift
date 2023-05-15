import Foundation

let count = Int(readLine()!)!
var dict = [String: Int]()
var result = 0

for i in 0..<count {
    var str = String(readLine()!)
    var strArr = str.map{ String($0)}
    
    for j in 0..<strArr.count {     // 알파벳별 자릿수 합 구하기
        var num = 1
        for k in 1..<strArr.count-j {
            num = num * 10
        }
        if dict[strArr[j]] == nil {
            dict[strArr[j]] = num
        } else {
            dict[strArr[j]]! += num
        }
    }
    
}
var sortedDict = dict.sorted{ $0.value > $1.value }
var num = 9
for (key,value) in sortedDict {   // 자릿수합이 높은순서대로 큰 수 대입하기
    result = result + (value * num)
    num -= 1
}
print(result)
