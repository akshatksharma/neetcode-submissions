class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var dp = Array(repeating: 0, count: nums.count + 1)
        dp[0] = 0
        dp[1] = nums[0]

        for i in 2...nums.count {
            let pickNeighbor = dp[i-1]
            let pickCurrent = nums[i-1] + dp[i-2]

            dp[i] = max(pickNeighbor, pickCurrent)
        }

        return dp[nums.count]
    }

    /*
    [10000, 20, 4, 100]
        F(i) = max amount of money picking i items

            F(3) = max(20, 10 + 4)
            F(i) = max(F(i-1), nums[i-1] + F(i-2))

            i <= 0
                -> 0

    */
}
