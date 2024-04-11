import Foundation

// 입력받기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var brokenBtns = [Int]()
if M != 0 {
    brokenBtns = readLine()!.split(separator: " ").map{Int(String($0))!}
}
// 현재채널 100, 100에서 누른횟수 최솟값
var minCount = abs(N - 100)

// 100만채널까지 모든 경우의 수를 탐색한다.
for i in 0..<1000001 {
    let len = length(num: i)
    // 고장나지않은 번호로 이동했다면 이동할때 누른 횟수와, 이동한 채널에서 +/-로 이동한 횟수를 더한다.
    if len > 0 {
        let count = abs(N - i)
        minCount = min(minCount, count + len)
    }
}

// 고장나지 않은 번호로 이동했을때 버튼을 누른 횟수를 구한다.
func length(num: Int) -> Int{
    var n = num
    // 목적지 N이 0채널이라면
    if n == 0 {
        // 0번이 고장났다면 번호눌러서 이동할 수 없다.
        // 1번에서 이동해야함.
        if brokenBtns.contains(n)    {
            return 0
        } else {
            return 1
        }
    }
    
    var len = 0
    // 누른횟수 계산
    // 이동하려는 채널에 고장난번호가 포함되있다면 애초에 이동이 불가능하므로 0 리턴
    while n > 0 {
        if brokenBtns.contains(n % 10) { return 0 }
        n = n / 10
        len += 1
    }
    return len
}


print(minCount)
