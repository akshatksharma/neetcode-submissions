class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }

        var ans = [[Int]]()
        let nums = nums.sorted()

        // [1, 1, 0, -1]

        // [-3, -2, 0, 1, 1, 2, 5] target = 0

        for k in 0..<nums.count - 2 {
            if k > 0, nums[k-1] == nums[k] {
                continue
            }

            // 2 sum
            let target = -nums[k] // nums[i] + nums[j] = 0 - nums[k]
            var L = k+1
            var R = nums.count-1

            while L < R {
                let sum = nums[L] + nums[R]

                if sum < target {
                    L += 1
                } else if sum > target {
                    R -= 1
                } else {
                    while L < R, nums[L] == nums[L+1] {
                        L += 1
                    }

                    while L < R, nums[R] == nums[R-1] {
                        R -= 1
                    }

                    ans.append([nums[L], nums[R], nums[k]])

                    L += 1
                    R -= 1
                }
            }    
        }

        return ans
    }
}
