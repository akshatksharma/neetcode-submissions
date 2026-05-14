class Solution {
    /*
        [2,3,6,1,4] -> k = 2

            [2,3,1,4,6]

        [1,7,4,6,5] k = 4

            [1,4,7,6,5]
    */

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let targetIdx = nums.count - k 

        func quickSelect(_ l: Int, _ r: Int) -> Int {
            guard r - l + 1 > 1 else { return nums[l] } // if only 1 value

            let pivotIdx = r
            var swapIdx = l

            for i in l..<r {
                if nums[i] < nums[pivotIdx] {
                    (nums[i], nums[swapIdx]) = (nums[swapIdx], nums[i])
                    swapIdx += 1
                }
            }

            (nums[pivotIdx], nums[swapIdx]) = (nums[swapIdx], nums[pivotIdx])

            if targetIdx < swapIdx {
                return quickSelect(l, swapIdx-1)
            } else if targetIdx > swapIdx {
                return quickSelect(swapIdx+1, r)
            } else {
                return nums[swapIdx]
            }
        }

        return quickSelect(0, nums.count-1)
    }


}
