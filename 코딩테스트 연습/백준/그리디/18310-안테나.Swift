import Foundation

let count = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort{ $0 < $1}
if count == 1 {
    print(arr[0])
} else {
    print(arr[(count-1) / 2])
}
