class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // [2,-3,4,-2,2,1,-1,4]

        var maxSum = nums[nums.count-1]
        var dp = Array(repeating: 0, count: nums.count)
        dp[nums.count-1] = nums[nums.count-1]

        for i in stride(from: nums.count-2, through: 0, by: -1) {
            if dp[i+1] < 0 {
                dp[i] = nums[i]
            } else {
                dp[i] = nums[i] + dp[i+1]
            }

            maxSum = max(maxSum, dp[i])
        }

        return maxSum
    }

    /*
        can have zeros negatives
        can have duplicates

        [1, -2, 2, 3, -3] -> [2, 3] = 5

            brute force: O(n^2) try every subarray, track largest max across all

            usually when i think of subarrays or substrings i think of trying to slide a 
            window and build subarrays that way, since there's a lot of shared work
                but the negatives here might complicate that

                its not clear on what conditions to grow or shrink the subarray
            
            dp doesn't seem clear either (this is it)
                
                [1, -2, 2, 3, -3]

                dp[i]: max sum in subarray starting at i
                    basecase dp[nums.count-1] = nums[nums.count-1]
                    dp[i] = dp[i+1] < 0 ? nums[i] : nums[i] + dp[i+1]

                can build it up in reverse, keep track of largest max so far
                dp = [4,3,5,3,-3]
                

            for sums sometimes prefixes help?

                [1, -2, 2, 3, -3] 

                [0, 1, -1, 1, 4, 1]

                    array[i,j] = prefix[j+1] - prefix[i]

    */
}