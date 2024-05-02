import Foundation

let num = Int(readLine()!)!
var count = 0
var answer = ""
func hanoi(_ num: Int,_ from: Int,_ to: Int,_ place: Int) {
    if num == 1 {
        answer += "\(from) \(to)\n"
        count += 1
        return
    }
    hanoi(num-1, from, place, to)
    answer += "\(from) \(to)\n"
    count += 1
    hanoi(num-1, place, to, from)
}
hanoi(num, 1, 3, 2)
print(count)
print(answer)
