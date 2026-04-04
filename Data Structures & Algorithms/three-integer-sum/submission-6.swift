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

        for (I, numI) in nums.enumerated() {
            for (J, numJ) in nums.enumerated() {
                for (K, numK) in nums.enumerated() {
                    guard I != J, J != K, I != K else {
                        continue
                    }
                    
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
