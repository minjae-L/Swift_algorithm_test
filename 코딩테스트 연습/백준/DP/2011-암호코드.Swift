import Foundation

// 입력 받기
var str = Array(readLine()!).map{String($0)}
let n = str.count
str.insert("0", at: 0)
var alphabet = ["."]
var dp = Array(repeating: 0, count: str.count+1)
var chan = true
for i in 65...90 {
    alphabet.append(String(UnicodeScalar(UInt32(i))!))
}
dp[0] = 1

// dp[n]: n자리 암호코드를 변환할 수 있는 경우의 수
// 단, 0에 예외처리를 해야함. 코드는 1~26 A~Z까지 변환 가능하므로, 0 또는 26보다 큰수는 변환이 불가.(마찬가지로 00도 불가.)
for i in 1..<str.count {
    if i == 1 {
        // 첫번째 수가 0이면 애초에 변환 불가
        if Int(str[i])! == 0 {
            dp[n] = 0
            break
        } else {
            dp[i] = 1
        }
        continue
    }
    // 숫자가 0이라면, 세가지 경우의수가 존재
    // 앞자리가 1,2인 10 20 , 앞자리가 0인 00, 앞자리가 2보다 큰수 30, 40, 50 ...
    // 앞자리가 0이거나 앞자리가 2보다 큰수면 변환자체가 불가능
    // 앞자리가 1,2인경우는 경우의수가 늘어나지않음. 1 -> A , 10 -> J 1가지임
    if str[i] == "0" {
        if str[i-1] == "0" || Int(str[i-1])! > 2 {
            dp[n] = 0
            break
        }
    } else {
        dp[i] = (dp[i] + dp[i-1]) % 1000000
    }
    // 만약 앞자리수를 포함한 숫자가 10~26 이라면 경우의수가 늘어남. 1 -> A , 11 -> AA, L 1가지에서 두가지로 늘어난다.
    if Int(str[i-1] + str[i])! <= 26 && Int(str[i-1] + str[i])! >= 10 {
        dp[i] = (dp[i] + dp[i-2]) % 1000000
    }
}
print(dp[n])
