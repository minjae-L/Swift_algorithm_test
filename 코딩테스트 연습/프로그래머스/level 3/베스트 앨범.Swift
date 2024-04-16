import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict = [String: [[Int: Int]]]()
    var genre = [String: Int]()
    var result = [Int]()
    // 입력받기
    // ["장르명": [["고유번호": "플레이수"], ["고유번호": "플레이수"]]]
    for i in 0..<genres.count {
        if genre[genres[i]] == nil {
            genre[genres[i]] = plays[i]
            dict[genres[i]] = [[i: plays[i]]]
        } else {
            genre[genres[i]]! += plays[i]
            dict[genres[i]]!.append([i: plays[i]])
        }
    }
    var sortedGenre = genre.sorted{$0.value > $1.value}
    for i in 0..<sortedGenre.count {
        let g = sortedGenre[i].key
        var filteredGenre = dict.filter{$0.key == g}
        var sortedGenre = filteredGenre.values.flatMap{$0}.flatMap{$0}
        var sg = sortedGenre.sorted{
                                   if $0.value == $1.value {
                                       return $0.key < $1.key
                                   } else {
                                       return $0.value > $1.value
                                   }}
        for j in 0..<sg.count {
            if j == 2 { break }
            result.append(sg[j].key)
        }
    }
    return result
}
