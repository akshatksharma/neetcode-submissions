class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count + 1)

        var ans = dp[0]

        for i in stride(from: nums.count-1, through: 0, by: -1) {
            for j in i+1..<nums.count {
                if nums[j] > nums[i] {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
            ans = max(ans, dp[i])
        }

        return ans
    }

    /*
        dp: [1, 1, 1, 1, 0]

        [1, 2, 20, 4]

                        _
                1       2       20      4
            _          _        _         _
        2   20  4     20  4      X          X
        _
    20     4


        repeated work ... 
            at i = 2 -> 0 because no options after it are greater
            at i = 3 -> 0 because no options after it remain
            when we compute i=2 in the i=1 branch, we can reuse it later

        F(i) has the length of longest increasing subsequence starting at i

        F(i) = 1 + max( F(j) where j goes from i+1...nums.count-1 )
            * j > nums.count -> F(j) = 0
            * nums[j] <= nums[i] -> F(j) = 0


        can initialize a 1d array of size n (nums.count) and build it up backwards
            for each element, we need to loop through the all the values for all the values
                like when i = 0
            so it's n^2 to build it up

            time O(n^2)
            space O(n)
    */
}
