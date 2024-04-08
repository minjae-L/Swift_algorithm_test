import Foundation

// 입력받기
var lettles = [Int]()
for i in 0..<9 {
    lettles.append(Int(readLine()!)!)
}
lettles.sort(by: <)
// 아홉난쟁이키의 합과 난쟁이가 아닌 인덱스 저장용 튜플
var total = lettles.reduce(0, +)
var notLettlesIndex: (index1: Int, index2: Int) = (0,0)

// 완전탐색
for i in 0..<9 {
    var isFind = false
    for j in i+1..<9 {
        let sum = lettles[i] + lettles[j]
        if total - sum == 100 {
            isFind = true
            notLettlesIndex = (i,j)
        }
    }
    if isFind {
        break
    }
}

// 해당 난쟁이를 인덱스를 통해 제거하고, 위 반복문 특성상 무조건 i < j 이므로 index1 < index2 이다.
// 반복문에 중간값이 제거가된다면 전체 인덱스가 -1로 변경되므로 참고해서 제거해준다.
lettles.remove(at: notLettlesIndex.index1)
lettles.remove(at: notLettlesIndex.index2-1)
for i in lettles {
    print(i)
}
