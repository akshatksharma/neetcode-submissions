class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        /*

        could remove and shift, but would be a O(n) operation due to shift, so up to
        O(n^2) if we needed to remove every value of val

        since we dont care abt the values past k + we dont care about the 
        order of the elements before k, we could swap values to the end, which
        is O(1) operation and O(n) in the worst case

            [1, 2, 3, 5] -> [1, 5, 3, 2] k = 3

            [1, 2, 2, 3, 5] -> [1, 5, 2, 3, 2] -> [1, 5, 3, 2, 2] (we swap from the current list length)
            
            [2] -> k = 0

            []
    
        */

        var i = 0
        var k = nums.count

        while i < k {
            let num = nums[i]

            if num == val {
                // swap values at i and k-1
                nums[i] = nums[k-1]
                // reduce k
                k -= 1
            } else {
                i += 1
            }
        }

        return k

    }
}
