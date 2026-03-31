class Solution {

    /*
        [2, 3, 4] -> [12, 8, 6]

        [2, -3] -> [-3, 2]

        [5, 0, 2] -> [0, 10, 0] 


        Naive
        - for each elem multiply all other elems, O(N^2) time and O(1) space

        Multiply approach
        - multiply everything together, divide by each elem 
        - breaks when item is 0 tho
    */

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        for (outerIdx, _) in nums.enumerated() {
            var rollingProduct = 1
            for (innerIdx, innerNum) in nums.enumerated() {
                if innerIdx != outerIdx {
                    rollingProduct *= innerNum
                }
            }
            ans.append(rollingProduct) 
        }

        return ans
    }
}
