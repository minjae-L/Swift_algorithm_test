import Foundation

// 종료될때까지 입력
while let n = readLine() {
    var num = Int(n)!
    var a = 1
    if num == 0 {
        a = 1
    } else {
        for i in 0..<num {
            a *= 3
        }
    }
    // 출력
    print(kt(a))
}
// 출력 재귀호출
func kt(_ num: Int) -> String{
    if num == 1 {
        return "-"
    }
    return "\(kt(num/3))\(String(repeating: " ", count: num/3))\(kt(num/3))"
}

