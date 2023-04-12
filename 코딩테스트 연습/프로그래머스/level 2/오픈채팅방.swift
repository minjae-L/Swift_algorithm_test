import Foundation

func solution(_ record:[String]) -> [String] {
    var arr = [String]()
    var resultArr = [String]()
    var userDic = [String: String]()
    var userArr = [String]()
    var actArr = [String]()
    
    for i in record {
        var strArr = String(i).components(separatedBy: " ")
        switch strArr[0] {
            case "Enter":
                actArr.append("님이 들어왔습니다.")
                userDic[strArr[1]] = strArr[2]
                userArr.append(strArr[1])
            case "Leave":
                actArr.append("님이 나갔습니다.")
                userArr.append(strArr[1])
            case "Change":
                userDic[strArr[1]] = strArr[2]
            default:
            print("Nothing")
        }
        
    }
    for i in 0..<userArr.count {
        guard let nickname = userDic[userArr[i]] else { return [] }
        userArr[i] = nickname
    }
    for i in 0..<userArr.count {
        resultArr.append("\(userArr[i])" + "\(actArr[i])")
    }
    return resultArr
}
