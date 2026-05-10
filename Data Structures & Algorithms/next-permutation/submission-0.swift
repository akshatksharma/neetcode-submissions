class Solution {
    func nextPermutation(_ nums: inout [Int]) {

        // find first num less than number before it from the right
        var i = nums.count - 2
        while i >= 0, nums[i] >= nums[i+1] {
            i -= 1
        }

        // if i < 0 it whole array is descending aka we're at the max permutation, so we reverse the whole thing 
        if i < 0 {
            reverse(&nums, 0, nums.count-1)
            return
        }

        // else find next biggest num from the right and swap it, then reverse rest
        var j = nums.count-1
        while j >= 0, nums[j] <= nums[i] {
            j -= 1
        }
        nums.swapAt(i,j)
        reverse(&nums, i+1, nums.count-1)
    }

    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var lo = start
        var hi = end

        while lo < hi {
            nums.swapAt(lo, hi)
            lo += 1
            hi -= 1
        }
    }

    /*
        1,2,3

            1,2,3
            1,3,2
            2,1,3
            2,3,1
            3,1,2
            3,2,1


            observations


            2 1 3 4

                walking from back ... when we see something less than the previous, then we need to swap
                that value and the next biggest value after it
   
            2 1 4 3 

                2 1 4 3 -> 2 3 4 1 -> 2 3 1 4





            2 3 1 4

            2 4 3 1

            3 1 2 4
             

    */
}