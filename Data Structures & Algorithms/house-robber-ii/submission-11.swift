class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] } // one house there's only 1 ans

        func robImpl(_ nums: [Int]) -> Int {
            var dp = Array(repeating: 0, count: nums.count + 1)
            dp[nums.count-1] = nums[nums.count-1] // max val at last value is just robbing that house's value

            for i in stride(from: nums.count-2, through: 0, by: -1) {
                dp[i] = max(
                    nums[i] + dp[i+2],
                    dp[i+1]
                )
            }

            return dp.max()!
        }

        let n = nums.count
        let maxWithFirstHouse = robImpl(Array(nums[0..<n-1]))
        let maxWithLastHouse = robImpl(Array(nums[1..<n]))

        return max(maxWithFirstHouse, maxWithLastHouse)
    }

    /*

    0    1    2   3  4
               -2   -1
    [10, 20, 100, 2, 5]

    need to handle out of bounds by indexing backwards
    

    */
}
