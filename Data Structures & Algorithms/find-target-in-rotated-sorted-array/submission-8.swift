class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
            guard nums.count > 1 else { return nums[0] == target ? 0 : -1 }

            var lo = 0
            var hi = nums.count - 1

            while lo <= hi {
                let mid = (lo + hi) / 2
                
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < nums[hi] { // right half is sorted
                    if (nums[mid]...nums[hi]).contains(target) {
                        lo = mid + 1
                    } else {
                        hi = mid - 1
                    }
                } else { // left half is sorted
                    if (nums[lo]...nums[mid]).contains(target) {
                        hi = mid - 1
                    }  else {
                        lo = mid + 1
                    }
                }
            }

            return -1
        }
}
