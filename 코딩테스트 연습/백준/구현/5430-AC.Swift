import Foundation

// 테스트케이스 수
let T = Int(readLine()!)!

for i in 0..<T {
    // 입력받기
    let p = readLine()!
    let n = Int(readLine()!)!
    var arr = [Int]()
    let strNum = readLine()!
    var str = ""
    
    // 입력받은 배열의문자열을 숫자배열로 변환
    for j in strNum {
        if let num = Int(String(j)) {
            str += String(j)
        } else {
            if str != "" {
                arr.append(Int(str)!)
                str = ""
            }
        }
    }
    
    // start, end
    var start = 0
    var end = arr.count - 1
    // reversed: 뒤집혀있는가?
    // check는 문제에 정의된 조건으로 빈배열일때 첫번째수를 빼려고한다면 error, 이를 판단하기위해
    var reversed = false
    var check = true
    
    // 주어진 함수의문자열 실행
    for k in p {
        // 뒤집혀있는지 확인
        if k == "R" {
            reversed = !reversed
        } else if k == "D" {
            // 배열이 비어있거나, 배열수 이상으로 빼내서 start인덱스가 end를 넘어버렸다면
            if arr.isEmpty || start > end {
                check = false
            } else {
                // 뒤집힘에 따라 인덱스 조절
                if reversed {
                    end -= 1
                } else {
                    start += 1
                }
            }
        }
    }
    // 결과 출력 문자열
    var result = ""
    
    // 빈배열에서 D함수 실행했다면 error
    if check {
        if arr.isEmpty || start > end{
            print("[]")
        } else {
            // 뒤집혀있다면 범위 거꾸로 출력
            if reversed {
                for j in (start...end).reversed() {
                    if j == start {
                        result += "\(arr[j])"
                    } else {
                        result += "\(arr[j]),"
                    }
                }
            } else {
                // 그대로라면 그대로 출력
                for j in start...end {
                    if j == end {
                        result += "\(arr[j])"
                    } else {
                        result += "\(arr[j]),"
                    }
                }
            }
            print("[\(result)]")
        }
    } else {
        print("error")
    }
}
