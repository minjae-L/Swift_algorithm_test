func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var skills = skill
    var skillArray = [String]()
    var trees = skill_trees
    var seq = 0
    var canNum = 0

    for i in skills {
        var string = String(i)
        skillArray.append(string)
    }

    for i in 0..<trees.count {
        var tree = [String]()
        var index = [Int](repeating: 0, count: skillArray.count)
        for j in trees[i] {
            let string = String(j)
            tree.append(string)
        }

        for i in 0 ..< skillArray.count {
            for j in 0 ..< tree.count {
                if skillArray[i] == tree[j] {
                    index[i] = j + 1
                    break
                }
            }
        }
        if index.isEmpty || index.count == 1{
            canNum = trees.count
        } else {
            while index.count > 0 {
                var j = 1

                if index[0] == 0 {
                    if index[0] == index[1] {
                        index.removeFirst()
                        if index.count == 1 {
                            canNum += 1
                            break
                        }
                        continue
                    } else {
                        break
                    }
                } else {
                    if index[0] < index[1] || index[1] == 0 {
                        index.removeFirst()
                        if index.count == 1 {
                            canNum += 1
                            break
                        }
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    }
    return canNum
}
