import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let INF: Int = 10000000
var cnt = INF
var lidx = 0
var ridx = 0
var sum = arr[lidx]

// 투포인터
// 구간합이 S보다 작다면 오른쪽인덱스를 증가시켜 구간합을 증가 , 길이 증가
// 구간합이 S보다 크거나 같다면 왼쪽인덱스를 증가시켜 구간합을 감소, 길이 감소
while lidx <= ridx && lidx <= arr.count-1 {
    if sum >= S {
        cnt = min(cnt, ridx - lidx + 1)
        sum -= arr[lidx]
        lidx += 1
    } else if sum < S {
        ridx += 1
        if ridx > arr.count - 1 { break }
        sum += arr[ridx]
    }
}

// 출력
if cnt == INF {
    print(0)
} else {
    print(cnt)
}
