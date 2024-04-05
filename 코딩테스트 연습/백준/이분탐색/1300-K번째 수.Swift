import Foundation

let N = Int(readLine()!)!
let k = Int(readLine()!)!

var startIndex = 0
var endIndex = N * N
var result = 0

while startIndex <= endIndex {
    var midIndex = (endIndex + startIndex) / 2
    var count = 0
    for i in 1...N {
        count += min(midIndex / i, N)
    }
    if count >= k {
        result = midIndex
        endIndex = midIndex - 1
    } else {
        startIndex = midIndex + 1
    }
}

print(result)
