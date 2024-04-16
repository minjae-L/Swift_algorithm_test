import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    // 투포인터 start, end
    var start = 0
    var end = 0
    // k와 비교할 합계
    var sum = sequence[start]
    // [start, end]형식으로 저장할 배열과 해당 수열의 길이를 저장할 배열
    var result = [[Int]]()
    var length = [Int]()
    var min = Int.max
    var answer: [Int] = []
    
    // 투포인터 알고리즘 탐색
    while start <= end && end < sequence.count{     
        // 주어진 부분수열이 k와 동일하다면 추가해주고, start 인덱스를 옮기고, end도 가능하다면 옮김
        if sum == k {
            result.append([start, end])
            length.append(abs(start - end))
            sum -= sequence[start]
            start += 1
            
            if end+1 < sequence.count {
                end += 1
                sum += sequence[end]
            }
        } else if sum < k {
            // 합계가 k보다 작다면 end를 늘려 그만큼 합산
            // 만약 end가 주어진 수열의 끝번째자리인데 합계가 k보다 작다면 합계를 더 늘릴방법이 없으므로 탈출
            if end+1 < sequence.count {
                end += 1
                sum += sequence[end]
            } else {
                break
            }
        } else if sum > k {
            // 합계가 k보다 크다면 start를 올려 값을 낮춘다.
            sum -= sequence[start]
            start += 1
        }
    }
    
    // 주어진 여러가지 부분수열중 가장 길이가짧고 앞의 인덱스인 부분수열을 출력
    // 시작인덱스 start는 이미 오름차순으로 정렬되어있다(+1씩 증가하면서 답을 찾았기때문)
    for i in 0..<length.count {
        if min > length[i] {
            if length[i] == 0 {
                answer = [result[i][0],result[i][1]]
                break
            } else {
                answer = [result[i][0],result[i][1]]
                min = length[i]
            }
        }
    }
    return answer
}
