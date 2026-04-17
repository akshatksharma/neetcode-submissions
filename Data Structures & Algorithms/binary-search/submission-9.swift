class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        while l < r {
            let mid = l + ((r - l) / 2)

            if nums[mid] > target {
                r = mid
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                return mid
            }
        }

        return nums[l] == target ? l : -1
    }
}
