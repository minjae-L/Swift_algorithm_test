import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var weight = w
    var height = h
    var wArr = [Int]()
    var hArr = [Int]()
    var num = 1
    var result = w + h
    
    for i in 1...height{
        if w % i == 0 {
            wArr.append(i)
        }
    }
    for i in 1...weight{
        if h % i == 0 {
            hArr.append(i)
        }
    }
    if let num = wArr.filter{ hArr.contains($0)}.max() {
        result = result - num
    }
    answer = Int64(w * h - result)
    return answer
}
