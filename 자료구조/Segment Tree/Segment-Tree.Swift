import Foundation

// 연속된 데이터 예시
// 트리의 특성(왼쪽자식인덱스:index*2, 오른쪽자식인덱스:index*2+1)를 이용하기위해 배열 첫번째는 임의의데이터를 넣는다.
var arr = Array(0...10)
// 크기 할당
var segTree = Array(repeating: 0, count: arr.count*4)

// 세그먼트 트리 만들기 (재귀호출)
// 구간합을 구해서 더한값이 부모노드가 됨
// 재귀호출로 맨 아래의 노드(start=end)까지 도달 후 더해서 부모노드를 채워가는 형식으로 진행됨
// start: 배열arr의 첫번째인덱스, end: 배열arr의 마지막인덱스
// index: 세그먼트트리의 인덱스
func segmentTreeInit(_ start: Int, _ end: Int, _ index: Int) -> Int{
    // 구간의 start == end는 해당 위치의 원소를 의미
    // 배열 arr의 3부터3까지의 구간합은 결국 arr[3]이다.
    if start == end {
        segTree[index] = arr[start]
        return segTree[index]
    }
    // 구간을 둘로 나누어 트리 특성상 왼쪽노드의 위치는 index*2, 오른쪽노드는 index*2+1
    var mid = (start + end) / 2
    // 재귀호출
    // 해당 구간합은 그 위치의 왼쪽 자식노드와 오른쪽자식노드의 합이다.
    segTree[index] = segmentTreeInit(start, mid, index*2) + segmentTreeInit(mid+1, end, index*2+1)
    return segTree[index]
}

// 특정 구간합 구하기
// start: 배열arr의 시작인덱스, end: 배열arr의 마지막인덱스
// index: 세그먼트 트리의 인덱스(재귀호출을위해 1로 입력)
// left: 구하려는 범위의 시작인덱스, right: 구하려는범위의 마지막인덱스
func segmentTreeSum(_ start: Int,_ end: Int,_ index: Int,_ left: Int,_ right: Int) -> Int{
    // left...right 범위를 벗어났다면 0리턴
    if left > end || right < start { return 0 }
    // left...right 범위내에 있는 구간합이라면 출력
    if left <= start && right >= end { return segTree[index] }
    // 자식노드로 재귀호출
    // 범위내의 구간합을 찾는다.
    let mid = (start + end) / 2
    return segmentTreeSum(start, mid, index*2, left, right) + segmentTreeSum(mid+1, end, index*2+1, left, right)
}

// 특정원소의 값 수정(증가 혹은 감소)
// start: 배열arr의 시작인덱스, end: 배열arr의 마지막인덱스
// index: 세그먼트트리의 인덱스
// node: 변경하려는 원소의 위치
// newValue: 변경값(증가 혹은 감소)
func segmentUpdate(_ start: Int,_ end: Int,_ index: Int,_ node: Int,_ newValue: Int) {
    // 수정하려는 값의 위치가 범위를 벗어나면 종료
    if node > end || node < start { return }
    // 수정하려는 값의 위치가 범위내에 존재하면 해당 구간합도 수정해준다.
    // 이때 수정하려는값을 더해준다.
    segTree[index] += newValue
    // 해당위치에 도달했다면 종료
    // 예: 배열arr의 3번째 원소를 수정한다면 3이 포함된 구간합을 모두 수정 후, 구간합 3~3의 노드까지 도달하면 종료
    if start == end { return }
    let mid = (start + end) / 2
    // 세그먼트트리의 왼쪽자식노드와 오른쪽자식노드 모두 접근
    segmentUpdate(start, mid, index*2, node, newValue)
    segmentUpdate(mid+1, end, index*2+1, node, newValue)
}

    
segmentTreeInit(1, arr.count-1, 1)
print(segmentTreeSum(1, arr.count-1, 1, 4, 6))
segmentUpdate(1, arr.count-1, 1, 3, 3)
print(segTree)

