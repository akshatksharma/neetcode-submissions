class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nums.count+1), count: nums.count+1)

        for i in stride(from: nums.count-1, through: 0, by: -1) {
            for j in stride(from: i-1, through: -1, by: -1) {
                var ans = dp[i+1][j + 1]

                if j == -1 || nums[j] < nums[i] {
                    ans = max(ans, 1 + dp[i+1][i + 1])
                }

                dp[i][j + 1] = ans
            }
        }

        return dp[0][0]
    }   

    /*
    - numbers can be 0 and negative
    - can have duplicates
    - at least 1 number

    [1, 20, 2, 4] -> 3 (1,4)

                1

            20      1

                 2       1

              4         4   
        
        0 1 2 3 4
      0         0
      1         0    
      2         0
      3         0
      4 0 0 0 0 0 




        F(i, j) = max ( F(i+1, j), 1 + F(i+1, i) ) 
            i is the index of the number we're considering
            j is the index of the last number we considered

            i >= nums.count -> 0
            nums[i] <= nums[j] -> 0

        time: O(n^2) where n is the size of nums
        space: O(n^2) to hold the dp table

    */
}
