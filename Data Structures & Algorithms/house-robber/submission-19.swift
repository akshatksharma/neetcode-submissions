class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var dp = [0, nums[0]]

        for i in 2...nums.count {
            let pickNeighbor = dp[1]
            let pickCurrent = nums[i-1] + dp[0]

            let max = max(pickNeighbor, pickCurrent)
            dp[0] = dp[1]
            dp[1] = max
        }

        return dp[1]
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
