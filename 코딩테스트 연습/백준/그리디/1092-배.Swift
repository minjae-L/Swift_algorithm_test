import Foundation

let count = Int(readLine()!)!
var crain = readLine()!.split(separator: " ").map{ Int($0)! }
let boxCount = Int(readLine()!)!
var box = readLine()!.split(separator: " ").map{ Int($0)! }
var time = 0

// 크레인과 박스 내림차순
crain.sort{ $0 > $1}
box.sort{ $0 > $1}

// 크레인중에 박스의 무게보다 무게제한이 낮은 크레인은 지운다.
while !crain.isEmpty && crain[crain.endIndex - 1] < box[box.endIndex - 1] {
    crain.removeLast()
}

// 옮길수 없다면 -1
// 크레인의 무게제한이 큰것부터 무게가 많이나가는 박스를 우선으로 옮겨준다.
if crain.count == 0 || crain[0] < box[0] {
    print(-1)
} else {
    while !box.isEmpty {
        var c = crain
        for i in 0..<crain.count {
            var idx = 0
            while idx < box.count && crain[i] < box[idx] {
                idx += 1
            }
            if idx < box.count {
                box.remove(at: idx)
            }
        }
        time += 1
    }
    print(time)
}
