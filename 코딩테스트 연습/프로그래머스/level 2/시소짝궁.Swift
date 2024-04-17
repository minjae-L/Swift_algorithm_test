import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var answer = 0
    var dict = [Double: Int]()
    // 딕셔너리에 저장
    // Swift는 나눗셈을 하면 소숫점을 모두 버리므로 정확한계산을 위해 무게는 Double형식으로 입력
    for i in weights {
        if dict[Double(i)] == nil {
            dict[Double(i)] = 1
        } else {
            dict[Double(i)]! += 1
        }
    }
    
    // 시소짝궁 찾기
    // a: 4, b:3 이라면 a와 b를 조합할 수 있는 경우의수: a x b = 12
    for i in dict {
        // 같은 무게
        if i.value > 1 {
            answer += (i.value * (i.value - 1)) / 2
        }
        // 2배의 무게
        if dict[i.key * 2] != nil {
            answer += (i.value * dict[i.key * 2]!)
        }
        // 2/3배의 무게
        if dict[i.key * 2 / 3] != nil {
            answer += (i.value * dict[i.key * 2 / 3]!)
        }
        // 3/4배의 무게
        if dict[i.key * 3 / 4] != nil {
            answer += (i.value * dict[i.key * 3 / 4]!)
        }
        
    }
    return Int64(answer)
}
