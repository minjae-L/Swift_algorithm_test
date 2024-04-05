import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let K = input[0]
let N = input[1]
var arr = [Int]()
var result = Set<Int>()
for i in 0..<K {
    arr.append(Int(readLine()!)!)
    
}
var startIndex = 1
var endIndex = arr.max()!
var max = 0
while !(startIndex > endIndex) {
    var midIndex = (startIndex + endIndex) / 2
    var count = 0
    for i in arr {
        count += i / midIndex
    }
    if count >= N {
        if max < midIndex {
            max = midIndex
        }
        startIndex = midIndex + 1
    } else {
        endIndex = midIndex - 1
    }
}
print(max)
