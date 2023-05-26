import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var result = 1
var num = 0
var idx = 1

// 세로의 길이를 기준으로 길이가 1이면 이동 불가능
// 길이가 2이면 2,3번 이동방법 가능
if input[0] == 2 {
    result = (input[1] + 1) / 2
    if result > 4 {
        result = 4
    }
} else if input[0] > 2 {
    // 가로의길이가 7보다 크다면, 모든 이동방법 이용가능
    // 모든 이동방법을 한번씩 사용한 후, 남은 크기를 가장 효율적인 이동인 1번,4번으로만 이동
    if input[1] > 6 {
        result = 5
        idx = 7
        num = input[1] - 7
        result = result + num
    } else {
        // 가로의 길이가 7보다 작아도, 가장 효율적인 이동인 1번,4번을 이용하지만
        // 모든 이동방법을 사용하지 않았으므로 방문지점은 최대4가된다.
        result = result + input[1] - 1
        if result > 4 {
            result = 4
        }
    }
}

print(result)
