import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
let fileio = FileIO()
let count = fileio.readInt()

for i in 0..<count {
    let input = [fileio.readInt(), fileio.readInt()]
    var dp = Array(repeating: 0, count: input[0]+1)
    var needBuild = Array(repeating: Array(repeating: 0, count: 0), count: input[0]+1)
    var graph = [Int: [Int]]()
    var finalBuild = 0
    var fees = [0]
    var queue = [Int]()
    var degree = Array(repeating: 0, count: input[0]+1)
    
    // 각 건물당 소요되는 시간 배열
    for j in 0..<input[0] {
        fees.append(fileio.readInt())
    }
    
    // 해당 건물과, 건물을 지을 수 있는 다른 건물을 그래프배열에 저장
    for j in 0..<input[1] {
        let inp = [fileio.readInt(), fileio.readInt()]
        needBuild[inp[1]].append(inp[0])
        if graph[inp[0]] == nil {
            graph[inp[0]] = [inp[1]]
        } else {
            graph[inp[0]]!.append(inp[1])
        }
    }
    
    // 최종으로 지어야하는 건물의 번호
    finalBuild = fileio.readInt()
    
    // 탐색의 시작점, 위상정렬 알고리즘을 사용하기 위한 진입차수가 0인 건물의번호를 큐에 넣는다.
    for j in 1...input[0] {
        degree[j] = needBuild[j].count
        if needBuild[j].count == 0 {
            queue.append(j)
        }
    }
    var idx = 0
    
    // 위상정렬 알고리즘
    // 진입차수가 0인 건물을 큐에 넣는다.
    // 건물에서 뻗어나가는 다른 건물들의 진입차수를 -1 해준다.
    // 뻗어나간 다른건물들 중 진입차수가 0인 건물은 큐에 넣어준다.
    // 건물짓는 소요시간을 뻗어나간 다음 접점의 dp배열에 저장
    while idx < queue.count {
        var node = queue[idx]
        idx += 1
        dp[node] += fees[node]
        
        if graph[node] != nil {
            for i in graph[node]! {
                dp[i] = max( dp[i], dp[node])
                degree[i] -= 1
                if degree[i] == 0 {
                    queue.append(i)
                }
            }
        }
        
    }
    print(dp[finalBuild])
}
