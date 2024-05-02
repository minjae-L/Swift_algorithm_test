import Foundation

// 입력 받기
let num = Int(readLine()!)!
// 이동횟수
var count = 0
// 결과출력 문자열
var answer = ""

// 하노이 재귀함수
func hanoi(_ num: Int,_ from: Int,_ to: Int,_ place: Int) {
    // 남은 원판이 한개라면 옮기고 시작점과 도착점 저장, 횟수+1
    if num == 1 {
        answer += "\(from) \(to)\n"
        count += 1
        return
    }
    // n-1개의 원판을 여분공간으로 옮긴다.
    hanoi(num-1, from, place, to)

    // 맨 밑에 깔린 원판을 도착점에 옮긴다.
    answer += "\(from) \(to)\n"
    count += 1
    
    // 다시 n-1개의 원판을 여분공간으로 옮긴다.
    hanoi(num-1, place, to, from)
}
// 함수 실행
hanoi(num, 1, 3, 2)
// 결과 출력
print(count)
print(answer)
