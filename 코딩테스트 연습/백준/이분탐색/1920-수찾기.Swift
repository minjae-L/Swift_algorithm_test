func binarySearch<T: Comparable>(array: [T], start: Int, end: Int, target: T) -> Int? {
    var arr = array
    var startIndex = start
    var endIndex = end
    var midIndex = (end + start) / 2
    
    if startIndex > endIndex { return nil}
    if arr[midIndex] == target {
        return midIndex
    } else if arr[midIndex] > target {
        endIndex = midIndex - 1
        return binarySearch(array: arr, start: startIndex, end: endIndex, target: target)
    } else {
        startIndex = midIndex + 1
        return binarySearch(array: arr, start: startIndex, end: endIndex, target: target)
    }
}

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let M = Int(readLine()!)!
var findNums = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<M {
    let num = findNums[i]
    
    if let finded = binarySearch(array: arr, start: 0, end: arr.endIndex - 1, target: num) {
        print(1)
    } else {
        print(0)
    }
}
