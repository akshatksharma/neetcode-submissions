class Solution {

    /* 

    [1, 2, 3, 4] -> target = 1

    (0 + 3) / 2 -> 1

    []

    */

    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0, hi = nums.count - 1
        
        while lo <= hi {
            let mid = lo + ((hi - lo) / 2)

            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }

        return -1
    }
}
