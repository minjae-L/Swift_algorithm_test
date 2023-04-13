import Foundation

func solution(_ numbers:[Int]) -> String {
    var arr = numbers.map{String($0)}
    var sortedArr = arr.sorted{ if $0 + $1 > $1 + $0 {
        return true
    }else {
        return false
    } }
    if sortedArr.filter{$0 == "0"}.count == sortedArr.count {
        return "0"
    } else {
        return sortedArr.joined(separator: "")
    }
}
