class Solution {
        /*
    breakdown
    - array -> array of indices

    edge cases
    - empty array -> [] (n/a, will have at least 3)
    - negative / 0 numbers (yes any integer)
    - duplicates? yes



    [-1, 0, 1, 2, -2] -> [[-1, 0, 1], [-2, 2, 0]]

    implementations

    - brute force: search every triplet -> O(N^3)
    - n * 2sum 

        nums[i] + nums[j] + nums[k] = 0
        nums[i] + nums[j] = -nums[k]
        2sum with nums[i] + nums[j] needing to equal -nums[k]

        [-1, 0, 1, 0, 2, -2] -> [-2, -1, 0, 0, 1, 2, 2]
        [1, -1, 1, 0] -> [-1, 0, 1, 1]
    */

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()

        let sortedNums = nums.sorted()

        for k in 0..<sortedNums.count {
            // skip dupes
            if k > 0, sortedNums[k] == sortedNums[k-1] { continue }

            // run 2 sum with target = -nums[k]
            var L = k + 1
            var R = sortedNums.count - 1

            while L < R {
                let numsL = sortedNums[L], numsR = sortedNums[R], numsK = sortedNums[k]

                if numsL + numsR > -numsK {
                    R -= 1
                } else if numsL + numsR < -numsK {
                    L += 1
                } else {
                    ans.append([numsL, numsR, numsK])

                    while L < R, sortedNums[L] == sortedNums[L+1] {
                        L += 1
                    }

                    while L < R, sortedNums[R] == sortedNums[R-1] {
                        R -= 1
                    }

                    L += 1
                    R -= 1                    
                }
            }
        }
        
        return ans
    }
}
