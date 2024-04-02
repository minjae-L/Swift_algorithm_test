import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let K = input[1]

var arr = Array(1...N)
var result = [Int]()
var idx = 0
var answner = "<"

while !arr.isEmpty {
    idx = idx + K - 1
    if K > arr.count {
        while !(idx < arr.count) {
            idx = idx - arr.count
        }
    } else if idx >= arr.count {
        idx = idx - arr.count
    }
    result.append(arr.remove(at: idx))
}

for i in 0..<result.count {
    if i != result.count-1 {
        answner += "\(String(result[i])), "
    } else {
        answner += "\(String(result[i]))>"
    }
    
}

print(answner)

