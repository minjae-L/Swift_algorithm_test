import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]

    edge.forEach { (element) in
        if graph[element[0]] == nil {
            graph[element[0]] = [element[1]]
        } else {
            graph[element[0]]!.append(element[1])
        }
        if graph[element[1]] == nil {
            graph[element[1]] = [element[0]]
        } else {
            graph[element[1]]!.append(element[0])
        }
    }
    
    var needToVisit = [1]
    var saveNextVisitList: [Int] = []
    var visited = Array(repeating: false, count: n+1)
    var lastNode = [[Int]]()
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        visited[node] = true
        var nextNodes = graph[node]!
        saveNextVisitList += nextNodes
        
        if needToVisit.isEmpty {
            if saveNextVisitList.isEmpty {
                break 
            }
            let setVisitList = Array(Set(saveNextVisitList))
            for element in setVisitList {
                if !visited[element] {
                    needToVisit.append(element)
                    
                }
            }
            lastNode.append(needToVisit)
            saveNextVisitList = []
        }
    }
    return lastNode[lastNode.count-2].count
}
