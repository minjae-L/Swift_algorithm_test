import Foundation

let count = Int(String(readLine()!))!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
var sortedArr = arr.sorted{ $0 < $1 }
var sum = 0

for i in 0..<sortedArr.count {
    var num = 0
    for j in 0...i {
        num += sortedArr[j]
    }
    sum += num
}

print(sum)
