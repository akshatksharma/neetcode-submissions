class Solution {
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // nums1 will always be less size than nums2
        var nums1 = nums1
        var nums2 = nums2

        if nums2.count < nums1.count {
            (nums1, nums2) = (nums2, nums1)
        }

        var lo = 0
        var hi = nums1.count

        while lo <= hi {
            let mid = (lo + hi) / 2

            let totalCount = (nums1.count + nums2.count + 1) / 2

            let i = mid - 1 // index of where we need to pick in nums1 L array
            let j = (totalCount - mid) - 1 // index of where we need to pick in nums2 L array

            let nums1LMax = (0..<nums1.count).contains(i) ? nums1[i] : Int.min
            let nums1RMin = (0..<nums1.count).contains(i + 1) ? nums1[i + 1] : Int.max 
            
            let nums2LMax = (0..<nums2.count).contains(j) ? nums2[j] : Int.min  
            let nums2RMin = (0..<nums2.count).contains(j + 1) ? nums2[j + 1] : Int.max

            if nums1LMax <= nums2RMin && nums2LMax <= nums1RMin {
                // this is our answer 
                if (nums1.count + nums2.count) % 2 == 1 {
                    return Double(max(nums1LMax, nums2LMax))
                } else {
                    let lMax = Double(max(nums1LMax, nums2LMax))
                    let rMin = Double(min(nums1RMin, nums2RMin))
                    return (lMax + rMin) / 2.0
                }
            } else if nums1LMax > nums2RMin {
                hi = mid - 1 
            } else {
                lo = mid + 1
            }
        }

        return 0.0
    }
}
