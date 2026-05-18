class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count) // dp[i] = longest increasing subseq starting and i
        var ans = dp[0]

        for i in stride(from: nums.count-1, through: 0, by: -1) {
            // we look through the following items
            for j in i+1..<nums.count {
                if nums[i] < nums[j] {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
            ans = max(ans, dp[i])
        }

        return ans
    }
}


/*
    brute force
        at every idx you can either include the char in the subseq, or make a new one
            we can only include a new one if it's greater than our last one
            but there's a lot of overlap

                        _
                    
                    9            _

                            1           _

                        1 4    1      4

                            1 2     1

                        1 2 3   1 2

            0 1 2 3 4 5 6
            [9,1,4,2,3,3,7]

                        longest increasing subseq starting at i = 3 to the end

                        F(i) = 1 + max(F(j)) where for j .. i+1<nums.count

                            F(3) = 1 + max (
                                        1 (j=6)
                                        2 (j=5)
                                        1 (j=4)
                                    )
                
                            F(nums.count-1) = 1


                        dp works here ... we can do this backwards
                        
                    

*/