func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var gameBoard = [[String]]()
    var removeArr = [[Int]]()
    var isEnd = true
    
    for i in board {
        gameBoard.append(i.map{String($0)})
    }
    
    while isEnd {
        var removing = [[Int]]()
        
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                var str = gameBoard[i][j]
                if str == "0" {
                    continue
                }
                var arr = [gameBoard[i][j], gameBoard[i+1][j], gameBoard[i][j+1], gameBoard[i+1][j+1]]
                if arr.filter{ $0 == str }.count == 4 {
                    var addSet = [[i, j], [i, j+1], [i+1, j], [i+1, j+1]]
                    for k in addSet {
                        if removing.contains(k) {
                            continue
                        }
                        removing.append(k)
                    }
                }
            }
        }
        
        if removing.isEmpty {
            break
        } else {
            removeArr += removing
            for i in removing {
                gameBoard[i[0]][i[1]] = "0"
            }
        }
        
        for i in 1..<m {
            for j in 0..<n {
                var xIdx = m-i
                if gameBoard[xIdx][j] == "0" {
                    var idx = xIdx
                    while gameBoard[xIdx][j] == "0" && xIdx > 0 {
                        xIdx -= 1
                    }
                    gameBoard[idx][j] = gameBoard[xIdx][j]
                    gameBoard[xIdx][j] = "0"
                }
            }
        }
        
    }

    return removeArr.count
}
