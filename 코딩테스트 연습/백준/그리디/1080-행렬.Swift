import Foundation

let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
var a = [[String]]()
var b = [[String]]()
var result = 0

// 배열 입력받기
for i in 1...inputs[0]*2 {
    var arr = Array(readLine()!).map{ String($0) }
    if i <= inputs[0] {
        a.append(arr)
    } else {
        b.append(arr)
    }
}

// 배열의 크기가 연산가능한 크기보다 작다면
// 배열 a 와 b가 서로 다르다면, a는 b가 될 수 없으므로 -1
// 배열 a 와 b가 서로 같다면, a는 이미 b이므로 0 출력
if a.count < 3 || a[0].count < 3 {
    for i in 0..<a.count {
        let arr1 = a[i]
        let arr2 = b[i]
        if a[i] != b[i] {
            result = -1
        }
    }
    print(result)
} else {
    // 행은 n-2 까지, 열은 m-2 까지 순회
    // a[n][m] != b[n][m] 이면 연산
    for i in 0..<a.count-2 {
        for j in 0..<a[0].count-2 {
            var str1 = a[i][j]
            var str2 = b[i][j]

            if str1 == str2 {
                continue
            } else {
                result += 1
                for k in 0..<3 {
                    for n in 0..<3 {
                        if a[i+k][j+n] == "1" {
                            a[i+k][j+n] = "0"
                        } else {
                            a[i+k][j+n] = "1"
                        }
                    }
                }
            }
        }
    }
    
    // 연산결과 a와 b가 완전히 같은지 비교
    for i in 0..<a.count {
        let arr1 = a[i]
        let arr2 = b[i]
        
        if a[i] != b[i] {
            result = -1
        }
    }

    print(result)

}


