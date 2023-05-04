import Foundation

let count = Int(String(readLine()!))!
var arr = [Int]()

for i in 0..<count {
    let num = Int(String(readLine()!))!
    arr.append(num)
}
arr.sort{ $0 > $1}  // 로프의 최대 버틸수 있는 중량의 크기가 큰 순으로 정렬
var max = arr[0]

if arr.count == 1 { // 로프의 갯수가 한개라면 로프 하나의 중량값 출력
    print(max)
} else {
    for i in 1..<arr.count {    
        if max < arr[i] * (i+1) { // 로프의 갯수가 추가되면 추가된 로프의 중량 * 로프의 갯수 = 최대중량
            max = arr[i] * (i+1)
        }
    }
    print(max)
}
