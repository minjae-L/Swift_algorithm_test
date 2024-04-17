import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var reservation = [[Int]]()
    var rooms = [[Int]]()
    var answer = 0
    var index = 0
    // 시작시간과 종료시간을 숫자로 변환
    for i in 0..<book_time.count {
        var res = book_time[i]
        var start = res[0].split(separator: ":").joined(separator: "")
        var end = res[1].split(separator: ":").joined(separator: "")
        reservation.append([Int(start)!, Int(end)!])
    }
    
    // 예약배열을 시작시간 기준 오름차순으로 정렬
    // 시작시간이 같다면 종료시간이 빠른 순으로 정렬
    var sorted = reservation.sorted{ 
        if $0[0] == $1[0] {
        return $0[1] < $1[1]
    } else {
        return $0[0] < $1[0]
    }}
    // index: 정렬된 예약배열 인덱스
    // answer: 정답출력 변수
    while index < sorted.count {
        // 이용중인 방이 없다면 바로 넣는다.
        if rooms.isEmpty {
            rooms.append(sorted[index])
            index += 1
            answer += 1
            continue
        }
        // 다음예약자의 시작시간과 종료시간
        var resStart = sorted[index][0]
        var resEnd = sorted[index][1]
        var find = false
        // 이용중인 방이 있다면 종료시간들을 검사한다.
        for i in 0..<rooms.count {
            var end = rooms[i][1]
            end += 10
            var str = String(end)
            // 종료후 청소시간이 60~69 사이라면 시단위가 올라가야한다.
            if Int(str.suffix(2))! >= 60 {
                end += 100
                end -= 60
            }
            // 종료시간과 다음예약의 시작시간이 동일하거나 작다면 이 방으로 다음예약을 넣는다.
            if end <= resStart {
                rooms[i] = [resStart, resEnd]
                find = true
                break
            } 
        }
        // 교체가능한 방이 없다면 추가
        if !find {
            rooms.append([resStart,resEnd])
            answer += 1
        }
        index += 1
    }
    return answer
}
