import Foundation

while let input = readLine(), input != "." {
    let arr = input.map{String($0)}
    var stack = [String]()
    
    for i in 0..<arr.count {
        let str = arr[i]
        if str == "[" || str == "(" {
            stack.append(str)
        } else if str == "]" {
            if stack.last == "[" {
                stack.removeLast()
            } else {
                stack.append(str)
            }
        } else if str == ")" {
            if stack.last == "(" {
                stack.removeLast()
            } else {
                stack.append(str)
            }
        }
    }
    
    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
}

