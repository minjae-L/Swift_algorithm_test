import Foundation

// 입력받기
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let x = Int(readLine()!)!
var cnt = 0
var lidx = 0
var ridx = arr.count-1
arr.sort{$0 < $1}

// 배열을 오름차순으로 정렬하고, 투포인터 알고리즘 실행
// 합이 x보다 작다면 왼쪽인덱스를 증가, 합이 x보다 크다면 오른쪽인덱스를 감소
while lidx < ridx {
    let sum = arr[lidx] + arr[ridx]
    if sum == x {
        cnt += 1
        lidx += 1
    } else if sum < x {
        lidx += 1
    } else if sum > x {
        ridx -= 1
    }
}

print(cnt)

