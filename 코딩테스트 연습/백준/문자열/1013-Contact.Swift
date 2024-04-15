import Foundation

// 문자 해당 범위를 출력하기위해 별도의 메서드 생성
// 문자를 받는중 주어진 문자열을 초과한다면 임의의 문자(여기선 2)를 더 붙여준다.
extension String {
    func getRangeString(start: Int, end: Int, max: Int) -> String {
        var result = ""
        for i in start...end {
            if i >= max {
                result += "2"
            } else {
                result += "\(self[self.index(startIndex, offsetBy: i)])"
            }
        }
        return result
    }
}

// 테스트케이스 수
let T = Int(readLine()!)!
var result = String()

// dfs
func dfs(str: String, targetStr: String, count: Int, compare: String) {
    var target = targetStr
    // 찾는도중에 이미 찾았거나, 찾는범위가 주어진 문자열을 넘어버린경우 종료
    if result == "YES" || count > target.count {
        return
    }
    // 배치한 문자가 주어진 문자열과 동일하다면 YES
    // 하지만 마지막문자가 100으로 끝난다면 주어진 규칙과 맞지않는다.
    if str == target && compare != "100" {
        result = "YES"
        return
    }
    
    // 이전 문자와의 관계에 따라서 다음에 올 문자를 찾는다.
    // 맨 처음시작할때나 이전문자가 01 일때 올수있는문자 100, 01
    if compare == "" {
        var s1 = ""
        var s2 = ""
        
        //뒤의문자를 탐색
        if count+2 <= target.count {
            s1 = target.getRangeString(start: count, end: count+2, max: target.count)
        }
        if count+1 < target.count {
            s2 = target.getRangeString(start: count, end: count+1, max: target.count)
        }
        
        //앞의문자와 그다음 올수있는문자가 동일하다면 추가
        if s1 == "100" {
            dfs(str: str + "100", targetStr: target, count: count+3, compare: "100")
        }
        if s2 == "01" {
            dfs(str: str + "01", targetStr: target, count: count+2, compare: "")
        }
    } else if compare == "100" {
        // 이전문자가 100일때, 올수있는문자 0,1
        var s = ""
        
        //뒤의문자 탐색
        if count+1 <= target.count {
            s = target.getRangeString(start: count, end: count, max: target.count)
        }
        
        //뒤의문자와 그다음 올수있는문자가 동일하다면 추가
        if s == "1" {
            dfs(str: str + "1", targetStr: target, count: count+1, compare: "1")
        }
        if s == "0" {
            dfs(str: str + "0", targetStr: target, count: count+1, compare: "100")
        }
    } else if compare == "1" {
        // 이전문자가 1일때, 올수있는문자 100, 01, 1
        var s1 = ""
        var s2 = ""
        var s3 = ""
        
        //뒤의 문자 탐색
        if count <= target.count {
            s1 = target.getRangeString(start: count, end: count, max: target.count)
        }
        if count + 1 <= target.count {
            s2 = target.getRangeString(start: count, end: count+1, max: target.count)
        }
        if count + 2 <= target.count {
            s3 = target.getRangeString(start: count, end: count+2, max: target.count)
        }
        
        //뒤의문자와 그다음 올수있는문자가 동일하다면 추가
        if s1 == "1" {
            dfs(str: str + "1", targetStr: target, count: count+1, compare: "1")
        }
        if s2 == "01" {
            dfs(str: str + "01", targetStr: target, count: count+2, compare: "")
        }
        if s3 == "100" {
            dfs(str: str + "100", targetStr: target, count: count+3, compare: "100")
        }
    }
    
}
for i in 0..<T {
    result = "NO"
    var target = readLine()!
    dfs(str: "", targetStr: target, count: 0, compare: "")
    print(result)
}
    
