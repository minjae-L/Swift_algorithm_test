import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }

// 노가다로 풀기
//var num3 = [Int]()
//var num2 = [Int]()
//
//// ABC ABD ACE ADE
//// BDF BCF CEF DEF
//num3 = [arr[0] + arr[1] + arr[2],
//        arr[0] + arr[1] + arr[3],
//        arr[0] + arr[2] + arr[4],
//        arr[0] + arr[3] + arr[4],
//        arr[1] + arr[3] + arr[5],
//        arr[1] + arr[2] + arr[5],
//        arr[2] + arr[4] + arr[5],
//        arr[3] + arr[4] + arr[5]
//        ]
//
//// AB AC AD AE
//// BC BD BF CF
//// CE DE DF EF
//num2 = [arr[0] + arr[1],
//        arr[0] + arr[2],
//        arr[0] + arr[3],
//        arr[0] + arr[4],
//        arr[1] + arr[2],
//        arr[1] + arr[3],
//        arr[1] + arr[5],
//        arr[2] + arr[5],
//        arr[2] + arr[4],
//        arr[3] + arr[4],
//        arr[3] + arr[5],
//        arr[4] + arr[5]
//        ]
//
//var num3Min = num3.min()!
//var num2Min = num2.min()!
//var num1Min = arr.min()!
//
//if n == 1 {
//    print(arr.reduce(0, +) - arr.max()!)
//} else {
//    print(num3Min * 4 + num2Min * ((n-1) * 4 + (n-2) * 4) + num1Min * (4 * (n-1) * (n-2) + (n-2) * (n-2)))
//}

var min1 = min(arr[0], arr[5])
var min2 = min(arr[1], arr[4])
var min3 = min(arr[2], arr[3])

var sortedArr = [min1, min2, min3].sorted{ $0 < $1}
var num1Min = sortedArr[0]
var num2Min = sortedArr[0] + sortedArr[1]
var num3Min = sortedArr[0] + sortedArr[1] + sortedArr[2]


if n == 1 {
    print(arr.reduce(0, +) - arr.max()!)
} else {
    var result = 0
    result += num3Min * 4
    result += (num2Min * (n-1) * 4 + num2Min * (n-2) * 4)
    result += (num1Min * (n-1) * (n-2) * 4 + num1Min * (n-2) * (n-2))
    print(result)
}
