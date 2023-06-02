import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[String]]()
var str = ""
var hd = 0

// 문자열 입력
for i in 0..<input[0] {
    arr.append(Array(readLine()!).map{String($0)})
}

// 주어진 문자열의 열을 모두 비교
// 문자와 문자의 개수를 구한다.
// 문자를 배열에 저장해 오름차순으로 정렬하면 0번째 원소가 사전순으로 가장 앞선다.
// 해당 문자와 다른문자의 개수를 더해가면 주어진 문자열들과 Hamming Distance의 합이 최소가 된다.
for i in 0..<input[1] {
    var dict = [String: Int]()
    for j in 0..<input[0] {
        if dict[arr[j][i]] == nil {
            dict[arr[j][i]] = 1
        } else {
            dict[arr[j][i]]! += 1
        }
    }
    var hdNum = 0
    var s = [String]()
    for (key,value) in dict {
        if value == dict.values.max()! {
            hdNum = input[0] - value
            s.append(key)
        }
    }
    s.sort{ $0 < $1}
    str += s[0]
    hd += hdNum
}

print(str)
print(hd)
