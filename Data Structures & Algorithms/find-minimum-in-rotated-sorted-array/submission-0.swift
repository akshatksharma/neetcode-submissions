class Solution {

    /*
        logn keying me on binary search
        1 2 3 4 5 6 

                |      
        3 4 5 6 1 2


        at each iteration, compare the middle to the ends
            if the middle is less than both ends, you're at the min
            else, go towards the side with the smaller number

    */

    func findMin(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count - 1

        while lo < hi {
            let mid = lo + ((hi - lo) / 2)

            if nums[mid] > nums[hi] {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return nums[lo]
    }
}
