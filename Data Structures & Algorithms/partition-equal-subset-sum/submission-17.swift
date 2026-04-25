class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0) { $0 + $1 }
        let target = total / 2

        // memo
        var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: target + 1), count: nums.count + 1) // target + 1 so we can index target easily

        guard total % 2 == 0 else { return false }

        return canPartitionImpl(nums, target, 0, &memo)
    }


    func canPartitionImpl(_ nums: [Int], _ target: Int, _ index: Int, _ memo: inout [[Bool?]]) -> Bool {
        // base cases
        if target == 0 {
            return true
        }

        if target < 0 {
            return false
        }

        if index >= nums.count {
            return false
        }

        if let memoAns = memo[index][target] {
            return memoAns
        }


        var skipAns = canPartitionImpl(nums, target, index + 1, &memo)
        let noSkipAns = canPartitionImpl(nums, target - nums[index], index + 1, &memo)
        let canPartition = skipAns || noSkipAns

        memo[index][target] = canPartition

        return canPartition
    }


    /*
                            F(target - nums[i], i + 1)
        F(target, i) = {    OR
                            F(target, i + 1)





           [1, 2, 3, 4] -> target = 5

        5
            4
                2

            5

                3

                    0


                5


    */
}
