import Foundation

var str = ["U", "C", "P", "C"]
var arr = readLine()!.split(separator: " ").map{ String($0) }
var idx = 0

for i in arr {
    for j in i {
        let s = String(j)
        if idx < str.count && s == str[idx] {
            idx += 1
        }
    }
}

if idx == 4 {
    print("I love UCPC")
} else {
    print("I hate UCPC")
}
