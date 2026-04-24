class Solution {

    /*
    [2, 3, 3, 4] target = 6
        target = 4 | [2]
        target = 2 | [2, 2]

    [2, 3, 3, 4] target = 7 | []
        target = 5 | [2]
        target = 3 | [2, 2]
        target = 1 | [2, 2, 3]
    */

    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var curr = [Int]()

        func backtrack(_ nums: [Int], _ startIdx: Int, _ target: Int) {
            if target < 0 {
                return
            } else if target == 0 {
                ans.append(curr)
                return
            }

            for idx in startIdx..<nums.count {
                let num = nums[idx]
                curr.append(num)
                backtrack(nums, idx, target - num)
                _ = curr.popLast()
            }
        }

        backtrack(nums, 0, target)

        return ans
    }

    /*
        - distinct integers
            - can be empty? -> no
            - can have 0 or negatives? -> no
        - target
            - can be 0 or negative? -> no

        - return all unique combinations in any order
        - within one combination can pick the same number 

        [2, 3, 3, 4] target = 6
            target = 4 | [2]
            target = 2 | [2, 2]
            target = 0 | [2, 2, 2]

        [2, 3, 3, 4] target = 7 | []
            target = 5 | [2]
            target = 3 | [2, 2]
            target = 1 | [2, 2, 2]

        approach
        - return unique combinations 

        brute force -> try all combinations
            build up an array of arrays recursively, doing target - val
            try adding new elements 
                if target == 0, then we append to our answer and we return
                if target == negative, then we went too far and we return
                after returning start popping and then go forward in the array
            then pop

    */
}
