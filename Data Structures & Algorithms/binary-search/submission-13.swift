class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        if (nums[l] == target) { return l }
        if (nums[l] > target || nums[r] < target) { return -1 }

        while r - l > 1 {
            let mid = l + ((r - l) / 2)

            if nums[mid] < target {
                l = mid
            } else {
                r = mid
            }
        }

        return nums[r] == target ? r : -1
    }
}
