class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) { $0 + $1 }
        var memo = [[Int]: Bool]()

        guard sum % 2 == 0 else { return false }

        return canPartitionImpl(nums, 0, sum / 2, &memo)
    }

    func canPartitionImpl(_ nums: [Int], _ index: Int, _ target: Int, _ memo: inout [[Int]: Bool]) -> Bool {
        // base cases
        if let ans = memo[[index, target]] {
            return ans
        }

        if index >= nums.count {
            return false
        }

        if target == 0 {
            return true
        }

        // skip
        memo[[index, target]] = canPartitionImpl(nums, index + 1, target, &memo)

        // choose
        if target - nums[index] >= 0 {
            memo[[index, target]] = memo[[index, target]]! || canPartitionImpl(nums, index + 1, target - nums[index], &memo)
        }

        return memo[[index, target]]!
    }

    /*

    we can calculate the sum of the array in linear time -> total

    need to pick values until we reach total/2 ... if we can do that the other itmes
    will be able to reach total/2 (by definition)

    1 2 3 4
        total = 10
        1,4 ... 2,3

    
    for each element we can either choose it or not choose it 

            choose  not choose


               0
            0     4
           0  2      2
                1       -1
               5          -5
            
    we can choose / not choose until either
        target < 0 (we fail)
        i > nums.count (we fail)
        target == 0 (we win)

    */
}
