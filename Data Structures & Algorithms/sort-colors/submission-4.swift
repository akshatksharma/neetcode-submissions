class Solution {
    func sortColors(_ nums: inout [Int]) {
        var lo = 0
        var hi = nums.count - 1

        // all values before lo will be 0
        // all values between lo and mid will be 1
        // all values before hi will be 2

        /*
                L
                  M
                    H
            0 0 1 1 2

              L
                M
                    R
            0 1 1 2 2
        */
        var mid = 0
        while mid <= hi {
            if nums[mid] == 0 {
                // swap value to lo pos, increment lo and mid
                (nums[lo], nums[mid]) = (nums[mid], nums[lo])
                lo += 1
                mid += 1
            } else if nums[mid] == 1 {
                // increment mid, we want this here
                mid += 1
            } else { // nums[mid] == 2
                // swap value to hi pos, decrement hi 
                (nums[hi], nums[mid]) = (nums[mid], nums[hi])
                hi -= 1
                // don't increment mid since we don't know what it was
            }
        }
    }
}
