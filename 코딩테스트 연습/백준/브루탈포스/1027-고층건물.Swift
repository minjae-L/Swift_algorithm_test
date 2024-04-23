import Foundation

// 입력받기
let N = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map{Int(String($0))!}
var converted = [(x: Int, y: Int)]()
var result = Int.min
// 주어진 빌딩을 지붕의 좌표로 변환
for i in 0..<buildings.count {
    converted.append((x: i+1,y: buildings[i]))
}

// 모든 경우 탐색
for i in 0..<converted.count {
    var count = 0
    for j in 0..<converted.count {
        // 같은 빌딩이면 패스
        if i == j { continue }
        var see = true
        let x1: Double = Double(converted[i].x)
        let x2: Double = Double(converted[j].x)
        let y1: Double = Double(converted[i].y)
        let y2: Double = Double(converted[j].y)
        
        // y = ax + b 의 방정식중 a,b를 구하는 과정
        let a = (y2 - y1) / (x2 - x1)
        let b = y1 - (x1 * a)
        
        // 현재 빌딩 이전에 위치한 빌딩들과의 탐색
        if i > j {
            for k in j+1..<i {
                let leftValue: Double = Double(converted[k].y)
                let rightValue: Double = Double(converted[k].x) * a + b
                if leftValue >= rightValue {
                    see = false
                    break
                }
            }
        } else {
            // 현재 빌딩 이후에 위치한 빌딩들과의 탐색
            for k in i+1..<j {
                let leftValue: Double = Double(converted[k].y)
                let rightValue: Double = Double(converted[k].x) * a + b
                if leftValue >= rightValue {
                    see = false
                    break
                }
            }
        }
        if see {
            count += 1
        } else {
        }
    }
    result = max(result, count)
}
print(result)
