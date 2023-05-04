import Foundation

var arr = Array(readLine()!).map{ Int(String($0))! }
arr.sort{$0 > $1}             // 내림차순
var sum = arr.reduce(0, +)    // 각 자릿수를 더한값

if sum % 3 == 0 && arr.contains(0){ // 30의 배수는 무조건 마지막자리수가 0이 된다. 3의 배수 조건은 각 자릿수를 더한 값이 3으로 나누어떨어진다.
    print(arr.map{ String($0)}.joined(separator: ""))
} else {
    print(-1)
}

