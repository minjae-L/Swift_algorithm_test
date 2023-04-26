import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)
var weight = Array(repeating: 0, count: input[0] + 1)
var value = Array(repeating: 0, count: input[0] + 1)

for i in 1...input[0] {     // 해당 물건의 무게와 가치를 저장
    let item = readLine()!.split(separator: " ").map{ Int(String($0))! }
    weight[i] = item[0]
    value[i] = item[1]
}

for i in 1...input[0] {         // i는 물건의 갯수, 접근은 i번째 물건
    for j in 1...input[1] {     // j는 무게
        if weight[i] <= j {     // i번째 물건이 j만큼의 무게한도 배낭에 들어갈 수 있는 경우
            dp[i][j] = max(dp[i-1][j-weight[i]] + value[i], dp[i-1][j])
            // -> i번째 물건을 넣기위해 해당 무게를 비웠을 때의 최적값에 i번째 물건의 가치를 더한 값과
            // -> i번째 물건을 넣지않은 이전 최적값 중 큰값을 선택한다.
        } else {
            dp[i][j] = dp[i-1][j]   // i번째 물건을 넣을 수 없다면 i-1의 최적값을 선택
        }
    }
}

print(dp[input[0]][input[1]])   // N개의 물건과 W의 무게한도가 주어진 배낭의 최적값 출력
