import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = [Int]()
    for i in 1...dungeons.count {
        var arr = find(i)
        arr.forEach {
            var hp = k
            var count = 0
            for j in $0 {
                if hp >= dungeons[j][0] {
                    hp -= dungeons[j][1]
                    count += 1
                }
            }
            result.append(count)
        }
    }
    return result.max()!
}
func find(_ n: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func comb(_ arr: [Int]) {
        if arr.count == n {
            result.append(arr)
            return
        } else {
            for i in 0..<n {
                if !arr.contains(i) {
                    comb(arr + [i])
                }
            }
        }
    }
    comb([])
    return result
}
