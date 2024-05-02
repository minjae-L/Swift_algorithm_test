import Foundation


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0
var answer = ""
var tmp = Array(repeating: 0, count: arr.count+1)
var i = 0
var j = 0
var t = 1

arr.insert(0, at: 0)
mergeSort(&arr, 1, arr.count-1)
if answer == "" { print(-1)} else { print(answer) }
func mergeSort(_ arr: inout [Int],_ first: Int,_ last: Int) {
    if first < last {
        let mid = (first+last)/2
        mergeSort(&arr, first, mid)
        mergeSort(&arr, mid+1, last)
        merge(&arr, first, mid, last)
    }
}

func merge(_ arr: inout [Int],_ first: Int,_ mid: Int,_ last: Int) {
    i = first
    j = mid+1
    t = 1
    
    while i <= mid && j <= last {
        if arr[i] <= arr[j] {
            tmp[t] = arr[i]
            i += 1
        } else {
            tmp[t] = arr[j]
            j += 1
        }
        t += 1
    }
    while i <= mid {
        tmp[t] = arr[i]
        t += 1
        i += 1
    }
    while j <= last {
        tmp[t] = arr[j]
        t += 1
        j += 1
    }
    i = first
    t = 1
    while i <= last {
        arr[i] = tmp[t]
        count += 1
        if count == K { answer = String(arr[i])}
        i += 1
        t += 1
    }
    
}


