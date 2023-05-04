import Foundation

let count = Int(String(readLine()!))!
var arrA = readLine()!.split(separator: " ").map{ Int(String($0))! }
var arrB = readLine()!.split(separator: " ").map{ Int(String($0))! }
var sum = 0
arrA.sort{ $0 < $1} // 배열 A 오름차순
arrB.sort{ $0 > $1} // 배열 B 내림차순

for i in 0..<count{
    sum = sum + (arrA[i] * arrB[i])
}
print(sum)
