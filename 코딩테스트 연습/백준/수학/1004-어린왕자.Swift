import Foundation

let T = Int(readLine()!)!

for i in 0..<T {
    //입력받기
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = [input[0], input[1]]
    let arrive = [input[2], input[3]]
    let N = Int(readLine()!)!
    var count = 0
    
    // 주어진 모든 행성안에 출발점, 도착점이 있는지 확인
    for j in 0..<N {
        // x,y좌표에서 피타고라스의정리를 이용한 두 지점의 거리를 구하는방법 사용
        let planet = readLine()!.split(separator: " ").map{Int(String($0))!}
        let sDist = ((start[0] - planet[0]) * (start[0] - planet[0])) + ((start[1] - planet[1]) * (start[1] - planet[1]))
        let aDist = ((arrive[0] - planet[0]) * (arrive[0] - planet[0])) + ((arrive[1] - planet[1]) * (arrive[1] - planet[1]))
        let powR = planet[2] * planet[2]
        
        // 출발점이 반지름보다 짧고, 도착점이 반지름보다 길다면, 출발점은 행성안에 존재 -> 이탈필요
        if sDist < powR {
            if aDist > powR {
                count += 1
            }
        }
        // 출발점이 반지름보다 길고, 도착점이 반지름보다 짧다면, 도착점은 행성안에 존재 -> 진입필요
        if aDist < powR {
            if sDist > powR {
                count += 1
            }
        }
        
        // 나머지 경우의수들은 모두 행성밖에 존재하거나, 같은행성 안에존재
    }
    print(count)
}
