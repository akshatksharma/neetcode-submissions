class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        func dfs(_ nums: [Int]) -> Int {
            guard nums.count > 1 else { return nums[0] }
            
            var dp = Array(repeating: 0, count: nums.count)
            dp[0] = nums[0]
            dp[1] = max(nums[0], nums[1])

            for i in 2..<nums.count {
                let house = nums[i]
                let nextToNeighbor = dp[i - 2]
                let neighbor = dp[i - 1]

                dp[i] = max(house + nextToNeighbor, neighbor)
            }

            return dp[nums.count - 1]
        }

        let n = nums.count
        let maxWithFirstHouse = dfs(Array(nums[0..<n-1]))
        let maxWithLastHouse = dfs(Array(nums[1..<n]))

        return max(maxWithFirstHouse, maxWithLastHouse)
    }

    /*

    0    1    2   3  4
               -2   -1
    [10, 20, 100, 2, 5]

    need to handle out of bounds by indexing backwards
    

    */
}
