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
    - 

    */

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var numSet = Set<[Int]>()

        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    let numI = nums[i], numJ = nums[j], numK = nums[k]
                    if numI + numJ + numK == 0 {
                        numSet.insert([numI, numJ, numK].sorted())
                    }
                }
            }
        }

        let ans = numSet.map { Array($0) }

        return ans
    }
}
