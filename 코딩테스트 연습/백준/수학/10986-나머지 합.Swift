import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
// 주어진배열
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
// 합배열
var S = [Int]()
var sum = 0
// 합배열을 M으로 나눈 나머지배열
var divided = [Int]()
// 나누어떨어지는 갯수
var count = 0

// 합배열 만들기
for i in arr {
    sum += i
    S.append(sum)
}

// 나머지 배열만들기
divided = S.map{$0 % M}
// 나머지 배열중 나머지가 0이면 그 구간합은 나누어떨어지므로 더해준다.
count = divided.filter{$0 == 0}.count

// 나머지배열중 같은 나머지의 갯수중에 2개를 고르는 경우의수를 더한다.
// S[i~j] = S[j] - S[i-1] = 0이 되는 두개의 구간합이 필요하므로
for i in 0..<M {
    let num = divided.filter{$0 == i}.count
    count = count + (num * (num-1))/2
}
print(count)
