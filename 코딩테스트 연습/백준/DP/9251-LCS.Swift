import Foundation

var str1 = readLine()!
var str2 = readLine()!
var strArr1 = ["0"] + str1.map{String($0)}
var strArr2 = ["0"] + str2.map{String($0)}
var dp = Array(repeating: Array(repeating: 0, count: str1.count+1), count: str2.count+1)


for i in 1...str2.count {
    for j in 1...str1.count {
        if strArr2[i] == strArr1[j] {   // 비교하는 두 문자가 같으면 왼쪽 대각선에서 값 불러온다.
            dp[i][j] = dp[i-1][j-1] + 1
        } else {                        // 같지 않으면 왼쪽 혹은 위중 큰값으로 입력
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[str2.count][str1.count])

/*  ex)
 	 	A	C	A	Y	K	P
 	0	0	0	0	0	0	0
C	0	0	1	1	1	1	1
A	0	1	1	2	2	2	2
P	0	1	1	2	2	2	3
C	0	1	2	2	2	2	3
A	0	1	2	3	3	3	3
K	0	1	2	3	3	4	4
