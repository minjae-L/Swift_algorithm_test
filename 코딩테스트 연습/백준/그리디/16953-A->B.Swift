import Foundation

let input = readLine()!.split(separator: " ").map{ UInt64($0)! }
var a = UInt64(input[0])
var b = UInt64(input[1])
var result = 1

while b != a {
    
    if b < a {
        result = -1
        break
    }
    if b % 2 == 0 {
        b /= 2
    } else if b % 10 == 1 {
        b /= 10
    } else {
        result = -1
        break
    }
    result += 1
}
print(result)
