class Solution {
    func rob(_ nums: [Int]) -> Int {
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
}

/*
    [1,1,3,3]

                _

        1            1       3       3
    3     3       3


    [2,9,8,3,6] 0

    dp: [16 14 14 6 6 0]

                         _

        2             9         8        3         6
   8   3   6       3    6         6
  6

    if we start at the last house the max value we can rob is it's value
            6 : nums.count - 1

    for other houses, we can either
    * take it's value + the value of the house next over
    * skip it's value, and take the value of the neighbor

    can do this with dynamic programming

        F(i) = max value of robbing houses starting at i ... defaults to 0
            F(nums.count-1) = nums[nums.count-1]

            F(i) = max(
                        nums[i] + F(i+2),
                        F(i+1) 
                      )


*/