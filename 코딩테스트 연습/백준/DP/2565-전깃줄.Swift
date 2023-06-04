import Foundation

let count = Int(readLine()!)!
var a = Array(repeating: 0, count: 501)
var arr = [Int]()

// 연결된 전깃줄 입력 후, A번호 기준으로 오름차순으로 정렬된 B번호 배열 구하기
for i in 0..<count {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    a[input[0]] = input[1]
}
for i in a {
    if i == 0 { continue }
    arr.append(i)
}
arr.insert(0, at: 0)
var dp = Array(repeating: 1, count: arr.count+1)

// DP
// DP[n] = n번째 원소를 포함시킨 부분수열의 길이
// 가장 긴 증가하는 부분수열 길이 구하기
for i in 1...count {
    for j in 1..<i {
        if arr[i] > arr[j] {
            dp[i] = dp[j] + 1
        }
    }
}
print(count - dp.max()!)
