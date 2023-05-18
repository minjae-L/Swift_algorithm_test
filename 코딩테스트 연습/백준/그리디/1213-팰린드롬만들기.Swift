import Foundation

var arr = Array(readLine()!).map{ String($0) }
var dict = [String: Int]()
var first = [String]()
var middle = [String]()
var last = [String]()

// 팰린드롬 문자열은 중간을 기준으로 데칼코마니형태를 이루고있다.
// 앞 범위의 문자, 뒤 범위의 문자, 중간 기준이되는 문자 배열 3가지를 선언
// 주어진 문자열을 문자로 쪼갰을때, 문자의 갯수를 dict에 저장
for i in 0..<arr.count {
    if dict[arr[i]] == nil {
        dict[arr[i]] = 1
    } else {
        dict[arr[i]]! += 1
    }
}

// 문자의 사전순으로 정렬한다.
var sortedDict = dict.sorted{ $0.key < $1.key }

// 문자가 2개이상이면 2로 나눈 몫만큼 앞 뒤로 붙여준다.
// 붙이고 나서 문자가 남으면 중간에 붙여준다.
// 문자가 애초에 1개밖에없다면 중간에 붙여준다.
for (key, value) in sortedDict {
    if value > 1 {
        var n = value / 2
        var str = ""
        for i in 0..<n {
            str += key
        }
        first.append(str)
        last.insert(str, at: 0)
        if value % 2 != 0 {
            middle.append(key)
        }
    } else {
        middle.append(key)
        continue
    }
}

// 사전순으로 문자를 붙인 문자열을 뒤집어서 같다면 팰린드롬 문자열
var str = (first + middle + last).joined(separator: "")
if str == String(str.reversed()) {
    print(str)
} else {
    print("I'm Sorry Hansoo")
}
