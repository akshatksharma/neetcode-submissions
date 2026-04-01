class Solution {

    /*
    [1, 2, 3, 4] target is 3

        1 + 4 = 5 -> too big so we reduce r by 1
        1 + 3 = 4 -> too big so we reduce r by 1
        1 + 2 = 3 -> nice

    [-2, -1, 2, 3, 4] target is -3
        -2 + 4 -> 2
        -2 + 3 -> 1
        -2 + 2 -> 0
        -2 + -1 -> -3

    breakdown
    - 1 indexed answer
    - indices cannot be the same
    - our array is sorted
    - we know there is only one answer

    edge cases
    - empty array?
    - single array?
    - negative nums?


    approaches
    - binary search? -> n * nlogn
    - pointer approach: we know that if we sum 2 #s that we can increase/decrease the sum based on how we move

    */

    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0, r = numbers.count - 1

        while l < r {
            let sum = numbers[l] + numbers[r]

            if sum > target {
                // reduce r 
                r -= 1
            } else if sum < target {
                // increase l
                l += 1
            } else {
                // we have our answer
                break
            }
        }

        // 1 indexed
        return [l+1, r+1]
    }
}
