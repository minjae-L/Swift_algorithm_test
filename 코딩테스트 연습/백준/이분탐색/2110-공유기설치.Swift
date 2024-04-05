import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let C = input[1]
var arr = [Int]()

for i in 0..<N {
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)
var startIndex = 0
var endIndex = arr[arr.endIndex - 1] - 0
var result = 0

while startIndex <= endIndex {
    var count = 1
    var house = arr[0]
    let midIndex = (endIndex + startIndex) / 2
    for i in 0..<N {
        let nextHouse = arr[i]
        if midIndex <= nextHouse - house {
            count += 1
            house = nextHouse
        }
    }
    if count >= C {
        result = midIndex
        startIndex = midIndex + 1
    } else {
        endIndex = midIndex - 1
    }
}

print(result)
