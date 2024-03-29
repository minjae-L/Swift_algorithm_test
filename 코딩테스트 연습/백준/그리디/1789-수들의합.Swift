import Foundation

var num = Int(String(readLine()!))!
var idx = 0

while num > idx { // N의 갯수가 최댓값이 되게끔 idx = 1부터 1씩 증가하며 차감시켜준다.
    idx += 1
    num -= idx
}

print(idx)

/*S = 10 일때,

idx = 1 , S = S - idx = 9
idx = 2 , S = S - idx = 7
idx = 3 , S = S - idx = 4
idx = 4 , S = idx 가되므로 N의 최댓값은 4이다. [1,2,3,4]
idx = 4 라고 서로다른 N개의 자연수가 1,2,3,4 로 된 것은 아니다.

예로 S = 4 일때 

idx = 1, S = S - idx = 3

idx = 2, S = S - idx = 1

S < idx 가 되므로 N의 최댓값은 2 이지만, 서로다른 자연수는 [1,3] 이다.

 

이는 idx를 1씩 증감하고 S에서 빼주는것은

이전 idx가 서로다른 자연수로 들어가 있다고 생각하면된다.

예제 입력 200 의 결과는 19이다.

하지만 1에서 19까지 더한 수는 200이 아닌 190이다.

idx가 1부터 1씩 증가하면서 S를 뺄때, 

idx = 19일때 S에서 idx를 빼면 S = 10

10은 이미 idx가 19까지 올라오면서 거쳤던 자연수이다.

즉 S는 [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,29] 로 N의 최댓값은 19개 , 19가 되는것이다.

따라서 S가 idx 보다 작아질때까지 실행 했을때 idx값이 N의 최댓값이 되는것이다.
