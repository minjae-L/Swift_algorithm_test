import Foundation

let T = Int(readLine()!)!

for i in 0..<T {
    let arr = readLine()!.split(separator: " ").map{Double(String($0))!}
    let x1: Double = arr[0], y1 = arr[1], dist1 = arr[2]
    let x2: Double = arr[3], y2 = arr[4], dist2 = arr[5]
    var totalDist: Double {
        return sqrt(pow((abs(x1 - x2)), 2) + pow(abs(y1 - y2), 2))
    }
    if totalDist == 0 && dist1 == dist2{
        print(-1)
        continue
    }
    if totalDist > dist1 + dist2 {
        print(0)
    } else if totalDist == dist1 + dist2 {
        print(1)
    } else if totalDist < dist1 + dist2 {
        if totalDist > abs(dist1 - dist2) {
            print(2)
        } else if totalDist == abs(dist1 - dist2) {
            print(1)
        } else {
            print(0)
        }
    }
}


