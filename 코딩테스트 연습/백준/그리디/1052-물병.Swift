import Foundation

// 입력받기
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
var num = N
var cnt = 0

// 주어진 물병이 2로 나눈 몫은 합쳐진 물병의 개수
// 2로 나눈 나머지는 합쳐지지 않은 물병의 개수가 된다.
// 합쳐지지 않은 물병은 그대로 총 갯수에 더해주고, 합쳐진 물병의 개수가 2 이상이면 또 합쳐질 수 있기에 재귀호출
func bin(num: Int) -> Int{
    if num == 0 || num == 1 {
        return num
    }
    let div = num / 2
    let n = num % 2
    return bin(num: div) + n
}

while bin(num: num) > K {
    num += 1
    cnt += 1
}
print(cnt)
