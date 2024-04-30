import Foundation

// 트라이 자료구조
class Tries {
    // 문자열과, 다음 자식노드를 저장할 Dictionary 구현
    var child: [String: Tries] = [:]
    // 해당 정보의 마지막 문자인가 판단하는 변수지만 이 문제 해답을 구하기 위해선 사용하진 않았다.
    var end = false
    
    // 트라이 자료구조에 입력
    // arr: 정보로 얻은 문자열의 배열
    // currentIndex: 현재 인덱스(그림에서의 트리 깊이(depth)), idx: arr의 크기
    func insert(_ arr: [String],_ currentIndex: Int,_ idx: Int) {
        // 주어진 문자열배열을 모두 넣었다면 종료
        if currentIndex == idx {
            self.end = true
            return
        }
        // 해당 문자열이 처음 입력되는거라면 자식노드 만들어서 생성
        // 이미 만들어졌다면 통과
        if child[arr[currentIndex]] == nil {
            child[arr[currentIndex]] = Tries()
        }
        // 만들어진 자식노드를 통해서 그 다음 주어지는 문자열을 넣는다.
        child[arr[currentIndex]]!.insert(arr, currentIndex+1, idx)
    }
    
    // 트라이 구조에서 저장된 모든 노드의 문자열 출력
    func find(_ idx: Int) {
        // 같은 깊이라면 사전순으로 출력하기위해 오름차순
        var arr = Array(self.child.keys).sorted{ $0 < $1 }
        // 깊이를 의미하는 문자
        // 깊은만큼 "--" 추가
        var answer = ""
        for i in 0..<idx {
            answer += "--"
        }
        // 해당 깊이의 모든 문자열을 출력한다.
        // 문자열의 자식노드가 존재하면 재귀호출로 출력
        for i in arr {
            print("\(answer)\(i)")
            child[i]!.find(idx+1)
        }
    }
}

// 생성, 입력
var trie = Tries()
let N = Int(readLine()!)!

// 주어진 정보들을 모두 트라이구조에 넣는다.
for i in 0..<N {
    let info = readLine()!.split(separator: " ").map{String($0)}
    let foods = info[1..<info.count].map{String($0)}
    trie.insert(foods, 0, foods.count)
}
// 출력
trie.find(0)
