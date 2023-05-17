import Foundation

let count = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var rangeNum = [0,0]
var min = 0
var sortedArr = arr.sorted{ $0 < $1}

// 추의 무게가 담긴 배열을 오름차순으로 정렬한다.
// 첫번째 추의 무게가 1보다 큰 수라면 최솟값은 1이된다.
// 첫번째 추의 무게가 1이고, 추의 갯수가 1 이라면 최솟값은 2가된다.
for i in 0..<sortedArr.count {
    if i == 0 {
        if sortedArr[i] != 1 {
            min = 1
        } else {
            rangeNum = [0,1]
            min = 2
        }
    } else {
        // range는 추가된 추로 새롭게 측정할 수 있는 범위
        // rangeNum은 이전의 추로 측정할 수 있는 범위이다.
        var range = rangeNum.map{ $0 + sortedArr[i]}
        
        
        // 이전의 측정가능한범위의 최댓값+1이 새롭게 측정가능한 범위의 최솟값 보다 크거나 같다면 연속된것
        // 연속됬다면 새롭게 측정가능한 범위의 최댓값+1이 정답이 된다.
        // 반대라면 끊어진 범위중 최솟값 출력
        if rangeNum[1]+1 >= range[0] {
            rangeNum = [0, range[1]]
            min = rangeNum[1] + 1
        } else {
            min = rangeNum[1] + 1
            break
        }
    }
    
}

print(min)
