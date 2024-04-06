let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var list = [A[0]]


for i in 1..<A.count {
    if list.last! < A[i] {
        list.append(A[i])
    } else {
        var start = 0
        var end = list.count - 1
        var mid = (start + end) / 2
        while start <= end {
            mid = (start + end) / 2
            if list[mid] >= A[i] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        list[start] = A[i]
    }
}
print(list.count)
