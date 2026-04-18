class Solution {

    /*
    1 2 3 4 5 6

    0   2     5
    3 4 5 6 1 2 -> 4

    5 6 1 2 3 4

    3

    3

    */

    // search for 2
    //           |
    // 5 6 7 1 2 3 4

    // 1 3   -> 3


    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1

        while lo <= hi {
            let mid = (hi + lo) / 2

            if nums[mid] == target {
                return mid
            } else {
                if nums[mid] >= nums[lo] {
                    // see if sorted side is on the left + if target in there
                    if target >= nums[lo] && target < nums[mid] {
                        hi = mid - 1
                    } else {
                        // else go other side
                        lo = mid + 1
                    }
                } else {
                    // see if sorted side is on the right + if target in there
                    if target <= nums[hi] && target > nums[mid] {
                        lo = mid + 1
                    } else {
                        // else go other side
                        hi = mid - 1
                    }
                }
            }
        }

        return -1
    }
}
