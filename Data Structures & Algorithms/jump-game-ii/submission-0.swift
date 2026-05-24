class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }

        var dp = Array(repeating: nums.count, count: nums.count)
        dp[nums.count - 1] = 0

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] + i >= nums.count - 1 {
                dp[i] = 1
            } else {
                for j in i...i+nums[i] {
                    dp[i] = min(dp[i], 1 + dp[j])
                }
            }
        }

        return dp[0]
    }
}

/*
     0 1 2 3 4 5 
    [2,2,5,1,2,4]

*/