import Foundation

// 입력받기
var N = Int(readLine()!)!
var out = ""

// 그리기함수
// a / b 일때 b가 a보다 크면 0이다.
// 그래서 b를 3으로 나누고 다시 재귀호출
func draw(x: Int, y: Int, num: Int) {
    if x / num % 3 == 1 && y / num % 3 == 1 {
        out += " "
    } else {
        if num / 3 == 0 {
            out += "*"
        } else {
            draw(x: x, y: y, num: num/3)
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        draw(x: i, y: j, num: N)
    }
    out += "\n"
}
print(out)


