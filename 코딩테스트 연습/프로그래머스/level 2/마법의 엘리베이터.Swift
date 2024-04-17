import Foundation

func solution(_ storey:Int) -> Int {
    var current = storey
    var arr = Array(String(current).map{Int(String($0))!}.reversed())
    var answer = Int.max
    
    // DFS
    func dfs(arr: [Int], index: Int,count: Int) {
        // 모든 자리 탐색했다면 최솟값 구하기
        if index >= arr.count {
            answer = min(answer, count)
            return
        }
        var pulsNum = 10 - arr[index]
        var subs = arr
        var plus = arr
        
        // 현재자리에서 층수를 올리는 경우
        if index+1 < arr.count {
            plus[index+1] += 1
            dfs(arr: plus, index: index+1, count: count+pulsNum)
        } else if index == arr.count-1 && index < 10 {
            // 층수를 올려서 한자리수가 더 올라간경우 ex) 9층에서 10층
            plus.append(1)
            dfs(arr: plus, index: index+1, count: count+pulsNum)
        }
        // 현재자리에서 층수를 내리는 경우
        dfs(arr: subs, index: index+1, count: count+subs[index])

    }
    dfs(arr: arr, index: 0, count: 0)
    
    return answer
}
