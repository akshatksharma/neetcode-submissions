class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        return LIS(nums).count
    }

    func LIS(_ nums: [Int]) -> [Int] {
        var dp = nums.map { [$0] } // longest increasing subsequence starting at i
        var ans = dp[0]

        for startIdx in stride(from: nums.count-1, through: 0, by: -1) {
            for i in startIdx+1..<nums.count {
                if nums[i] > nums[startIdx], 
                   1 + dp[i].count > dp[startIdx].count {
                    dp[startIdx] = [nums[startIdx]] + dp[i]
                    
                    if dp[startIdx].count > ans.count {
                        ans = dp[startIdx]
                    }
                }
            }
        }
    
        return ans
    }

    func LISWithBacktrack(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        var currentAns = [Int]()

        func backtrack(_ startIdx: Int) {
            if currentAns.count > ans.count {
                ans = currentAns
            }

            for i in startIdx..<nums.count {
                if currentAns.isEmpty || nums[i] > currentAns.last! {
                    currentAns.append(nums[i])
                    backtrack(i + 1)
                    currentAns.removeLast()
                }
            }
        }

        backtrack(0)
        
        return ans
    }


    /*

        [7, 5, 3, 8, 9]

                                  _
         7           5                    3                   8         9 
    8       9      8    9              8     9             9         
 9               9                   9

    */
}
