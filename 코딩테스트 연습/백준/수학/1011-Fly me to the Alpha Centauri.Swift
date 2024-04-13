import Foundation

// 입력받기
let T = Int(readLine()!)!

// 테스트케이스
for i in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    // 거리
    var distance = input[1] - input[0]
    // 작동횟수
    var count = 1
    // 1부터 n까지의 등차수열
    var n = 1
    while true {
        if count % 2 == 0 {
            // 작동횟수가 짝수번이라면 등차수열은 1...N과 N...1 두개가 존재
            // 최대이동거리보다 주어진 거리가 작다면 이 횟수로 이동가능하다고 판단
            if n * (n + 1) >= distance {
                print(count)
                break
            }
        } else {
            // 작동횟수가 홀수번이라면 등차수열은 1...N과 N-1...1 두개가 존재
            // 최대이동거리보다 주어진 거리가 작다면 이 횟수로 이동가능하다고 판단
            if n * n >= distance {
                print(count)
                break
            }
        }
        // 작동횟수 증가
        count += 1
        // 작동횟수가 증가하고 홀수번이 된다면 n도 1 증가한다.
        // 1번: 1 , 2번: 1 1, 3번: 1 2 1 이되므로 n = 2가 된다.
        if count % 2 != 0 {
            n += 1
        }
    }
}
