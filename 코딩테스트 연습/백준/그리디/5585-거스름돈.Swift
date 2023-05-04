import Foundation

var money = 1000 - Int(String(readLine()!))!
var arr = [500, 100, 50, 10, 5, 1]
var result = 0

for i in arr {
    if i <= money {
        var num = money / i
        result += num
        money -= i * num
    }
}
print(result)
