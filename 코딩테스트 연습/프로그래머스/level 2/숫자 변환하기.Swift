import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var numSet = Set([x])
    var result = 0
    
    while true {
        var addSet = Set<Int>()
        if numSet.contains(y) {
            return result
        }
        for i in numSet {
            if i+n <= y {
                addSet.insert(i+n)
            }
            if i*2 <= y {
                addSet.insert(i*2)
            }
            if i*3 <= y {
                addSet.insert(i*3)
            }
        }
        numSet  = addSet
        result += 1
        if numSet.isEmpty {
            break
        }
    }

    return -1
}
