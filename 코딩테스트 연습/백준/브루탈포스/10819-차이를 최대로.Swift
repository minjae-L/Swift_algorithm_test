import Foundation

//입력받기
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0
var visited = Array(repeating: false, count: N)

// DFS 백트래킹
func dfs(count: Int, nums: [Int]) {
    if count == N {
        result = max(result, sum(nums: nums))
        return
    }
    
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            dfs(count: count+1, nums: nums + [arr[i]])
            visited[i] = false
        }
    }
}

// 합산
func sum(nums: [Int]) -> Int{
    var sum = 0
    for i in 0..<nums.count-1 {
        sum += abs(nums[i] - nums[i+1])
    }
    return sum
}

dfs(count: 0, nums: [])
print(result)
