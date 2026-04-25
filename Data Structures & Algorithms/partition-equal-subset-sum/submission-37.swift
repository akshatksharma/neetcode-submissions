class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) { $0 + $1 }
        let target = sum / 2

        guard sum % 2 == 0 else { return false }

        // i,j means that for sum i, do we have a valid subset with the first j elements
        var dp = Array(repeating: Array(repeating: false, count: nums.count + 1), count: target + 1)
        
        // base case when i = 0
        for j in 0...nums.count {
            dp[0][j] = true
        }

        for i in 1...nums.count {
            for sum in 0...target {
                let noPick = dp[sum][i-1]

                let prevSum = sum - nums[i-1]
                let pick = if prevSum >= 0 {
                    dp[prevSum][i-1]
                } else {
                    false
                }

                dp[sum][i] = noPick || pick
            }
        }

        return dp[target][nums.count]
    }

    /*
        [1, 2, 4, 3] target = 5

        0 1 2 3 4 5
        T T

        dp[i] is whether we can make a valid equal subset sum of size i

                    i = 0 -> true ... we can always make a valid equal subset of size 0 
        dp[i] = {   i < 0 || i >= dp.count -> false
                    i >= 0 && i < dp.count -> dp[i - nums[j]]


        dp[i] = dp[i - nums[j]]


        time: O(target * n) 
            for each value in dp array (size target + 1), the most work we do is 
            scan the input array nums of size n

    */
    
}
