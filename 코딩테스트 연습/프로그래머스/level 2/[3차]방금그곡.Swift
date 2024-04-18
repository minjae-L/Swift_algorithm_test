import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer = ["0", "(None)"]
    var index = 0
    var musics = [[String]]()
    var mCount = m.count
    
    // 주어진 음악정보를 음악길이만큼 늘리거나 줄여서 따로 저장한다.
    while index < musicinfos.count {

        var infos = musicinfos[index].split(separator: ",")
        // 재생시간 계산
        let start = infos[0].split(separator: ":").joined(separator: "")
        let end = infos[1].split(separator: ":").joined(separator: "")
        let startNum = Int(start.prefix(2))! * 60 + Int(start.suffix(2))!
        let endNum = Int(end.prefix(2))! * 60 + Int(end.suffix(2))!
        let total = (endNum - startNum)
        
        // 음악이름, 음악의 음정
        let name = infos[2]
        var music = infos[3].map{String($0)}
        var converted = [String]()
        var musicIndex = 0
        
        // 음정 문자열을 배열로 변환
        while musicIndex < music.count {
            var str = music[musicIndex]
            if str == "#" {
                musicIndex += 1
                continue 
            }
            if musicIndex == music.count-1 {
                converted.append(str)
                musicIndex += 1 
                continue
            }
            if music[musicIndex+1] == "#" {
                str = str + "\(music[musicIndex+1])"
                converted.append(str)
            } else {
                converted.append(str)
            }
            musicIndex += 1
        }
        
        // 변환한 배열을 통해 재생시간만큼 줄이거나 늘린다.
        let a = converted.joined(separator: "")
        var musicString = ""
        var sin = 0
        for i in 0..<total {
            musicString += converted[sin]
            sin += 1
            if sin == converted.count {
                sin = 0
            }
        }
        // 음악길이로 조절한 음악을 따로저장
        musics.append([String(musicString.count),String(musicString),String(name)])
        index += 1
    }
    
    // 같은 음악인지 판단
    for i in musics {
        let length = i[0]
        var str = i[1]
        let name = i[2]
        
        var sine = 0
        var strs = [String]()
        
        // m의 길이만큼 부분문자열 배열 생성
        while true {
            if sine + mCount > Int(length)! { break }
            sine += 1
            strs.append(String(str.prefix(mCount)))
            str.remove(at: str.startIndex)
        }
        """
        같은 문자열인지 확인
        1. i == strs.count-1
        뒷자리가 #이 아닌문자열이 들어온다면 뒤에 #이 이어지는지 확인해야한다. 
        하지만 뒤에 오는 문자가 없다면 같은문자로 판단
        2. (i+1 < strs.count && strs[i+1].suffix(1) != "#") 
        뒷자리가 더 올수있는상황에서 그다음 부분문자열의 마지막문자가 #이 아니라면, 그 뒤로 #이 올 수 없다는 뜻
        그래서 같은문자로 판단 (#이 안오는 일반 음정이다.)
        (부분 문자열 순서는 ex.ABCD의 2길이 문자열 이라면 AB, BC, CD 이므로 BC 뒤에 오는문자는 CD의 마지막문자 D)
        """
        for i in 0..<strs.count {
            if strs[i] == m {
                if i == strs.count-1 || (i+1 < strs.count && strs[i+1].suffix(1) != "#"){
                    if Int(answer[0])! < Int(length)! {
                        answer = [String(length), String(name)]
                    }
                }
            }
        }
    }
    return answer[1]
}


