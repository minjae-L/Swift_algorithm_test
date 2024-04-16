import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sorted = jobs.sorted{ 
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        } else {
            return $0[0] > $1[0]
        }
    }
    var jobQueue = [[Int]]()
    jobQueue = [sorted.removeLast()]
    var current = jobQueue.last![0]
    var total = 0
    
    while !jobQueue.isEmpty {
        let job = jobQueue.removeLast()
        total += abs(current - job[0]) + job[1]
        current += job[1]

        while !sorted.isEmpty && current >= sorted.last![0] {
            jobQueue.append(sorted.removeLast())
        }
        
        jobQueue.sort{ $0[1] > $1[1] }
        
        if jobQueue.isEmpty && !sorted.isEmpty {
            jobQueue.append(sorted.removeLast())
            current += abs(current - jobQueue.last![0])
        }
    }

    return total / jobs.count
}
