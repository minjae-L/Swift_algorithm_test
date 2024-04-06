# 이분탐색(Binary Search)

![image](https://github.com/minjae-L/Swift_algorithm_test/assets/54211648/b6f56375-e41a-43b5-8b8b-34be674166ce)

- 정렬된 데이터안에서 탐색범위를 절반씩 좁혀가며 찾는 방식
- 데이터가 정렬되어있어야함.
- 세가지 변수(start, end, target)을 이용해 재귀적 혹은 반복문으로 구현가능하다.


### 재귀호출
'''
import Foundation
// 이분탐색
func binarySearch(arr: [Int], start: Int, end: Int, target: Int) -> Int {
	// startIndex 가 endIndex를 넘으면 종료
    if start > end { return -1 }
    let mid = (start + end) / 2
    
    if arr[mid] == target {
        return mid		// 타겟을 찾으면 종료
    } else if arr[mid] > target {
    	// 중간에 위치한 값이 타겟보다 크면 값을 낮추기위해, endIndex를 옮긴다.
        return binarySearch(arr: arr, start: start, end: mid-1, target: target)
    }else {
        // 중간에 위치한 값이 타겟보다 작으면 값을 높이기위해, startIndex를 옮긴다.
        return binarySearch(arr: arr, start: mid+1, end: end, target: target)
    }
}

var a = [1, 3, 4, 5, 7, 8]
print(binarySearch(arr: a, start: 0, end: a.endIndex - 1, target: 3))
// 1
'''

### 반복문
'''
import Foundation

func binarySearch(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var result = -1
    var startIndex = start
    var endIndex = end
    // 이분 탐색
    while startIndex <= endIndex {
        let midIndex = (startIndex + endIndex) / 2
        // 타겟을 찾으면 탈출
        if arr[midIndex] == target {
            result = midIndex
            break
        } else if arr[midIndex] > target {
            // 타겟보다 큰경우 endIndex를 줄여 mid를 작게한다
            endIndex = midIndex - 1
        } else {
            // 타겟보다 작은경우 startIndex를 늘려 mid를 크게갖는다
            startIndex = midIndex + 1
        }
    }
    return result
}

var a = [1, 3, 4, 5, 7, 8]
print(binarySearch(arr: a, start: 0, end: a.endIndex - 1, target: 8))
// 5
'''
