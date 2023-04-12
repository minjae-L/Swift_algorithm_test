
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress = progresses
    var speed = speeds
    var leftDaysCount = [Int]()
    var result = [Int]()
    
    for i in 0..<progress.count {
        var num = 0
        var prg = progress[i]
        
        while prg < 100 {
            num += 1 
            prg = prg + speeds[i]
        }
        leftDaysCount.append(num)
    }
    
    while leftDaysCount.count > 0 {
        var first = leftDaysCount.removeFirst()
        var num = 1
        var leftFirstThing = 0
        if leftDaysCount.isEmpty {
            result.append(num)
        } else {
            leftFirstThing = leftDaysCount[0]
            while first >= leftFirstThing {
                num += 1
                leftDaysCount.removeFirst()
                if leftDaysCount.isEmpty {
                    break
                } else {
                    leftFirstThing = leftDaysCount[0]
                }
            }
            result.append(num)
        }
    }
    
    return result
}

