import Foundation

let inputs = readLine()!.split(separator: " ").map{ String($0) }

var minStr1 = Array(inputs[0]).map{ String($0) }
var maxStr1 = Array(inputs[0]).map{ String($0) }
var minStr2 = Array(inputs[1]).map{ String($0) }
var maxStr2 = Array(inputs[1]).map{ String($0) }

// 최소배열은 6은 5로, 최대배열은 5는 6으로 변경
for i in 0..<minStr1.count {
    if minStr1[i] == "5" {
        maxStr1[i] = "6"
    } else if minStr1[i] == "6" {
        minStr1[i] = "5"
    }
}

for i in 0..<minStr2.count {
    if minStr2[i] == "5" {
        maxStr2[i] = "6"
    } else if minStr2[i] == "6" {
        minStr2[i] = "5"
    }
}

print("\(Int(minStr1.joined(separator: ""))! + Int(minStr2.joined(separator: ""))!) \(Int(maxStr1.joined(separator: ""))! + Int(maxStr2.joined(separator: ""))!)")

