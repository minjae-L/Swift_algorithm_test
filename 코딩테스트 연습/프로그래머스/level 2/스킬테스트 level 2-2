// 2의 배수만큼 경기가 있을때, a의 선수가 b의 선수와 몇라운드에서 만나는지 구하시오

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var arr = [Int]()
    var seq = 0
    var checkNum = 0

    for i in 0..<n {
        arr.append(i + 1)
    }
    seq = arr.count / 2

    while arr.count > 0 {
        var result = [Int]()
        result.append(arr.removeFirst())
        result.append(arr.removeFirst())
        print("check: \(checkNum)")
        print("seq: \(seq)")
        if result.contains(a) && result.contains(b) {
            return answer + 1
        } else {
            if result[0] == a || result[0] == b {
                arr.append(result[0])
                checkNum += 1
                if checkNum == seq {
                    answer += 1
                    checkNum = 0
                    seq = arr.count / 2
                }
            } else {
                arr.append(result[1])
                checkNum += 1
                if checkNum == seq {
                    answer += 1
                    checkNum = 0
                    seq = arr.count / 2
                }
            }
        }
    }
    return answer
}
