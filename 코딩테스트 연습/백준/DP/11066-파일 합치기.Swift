import Foundation

var T = Int(readLine()!)!

// 테스트 케이스 수 만큼
while T > 0 {
    T -= 1
    // 입력 받기
    let K = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    // dp배열 선언
    var dp = Array(repeating: Array(repeating: 0, count: K+1), count: K+1)
    // 누적합 배열 구하기
    var sums = [0]
    for j in 0..<K {
        sums.append(sums[j] + arr[j])
    }
    
    // dp[i][j]: i부터 j까지의 파일 합 최소비용
    // dp[1][K]를 구한다.
    // 구간합을 구해서 최종적으로 dp[1][K]를 구한다.
    // dp[1][3]: [1], [2,3]과 [1,2], [3]이 존재하고, 두 부분합의 최솟값을 저장한다.
    for i in 1...K {
        for j in 1..<K-i+1 {
            dp[j][i+j] = 50000000
            for k in j..<i+j {
//                print("\nrange j ~ i+j : \(j) ~ \(i+j), k: \(k) range1 j ~ k: \(j)~\(k), range2 k+1 ~ i: \(k+1)~\(i+j)")
                dp[j][i+j] = min(dp[j][i+j], dp[j][k] + dp[k+1][i+j] + sums[i+j] - sums[j-1])
            }
        }
    }
    print(dp[1][K])
}
