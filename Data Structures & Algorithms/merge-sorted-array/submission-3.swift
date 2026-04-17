class Solution {

    /*
    integers, non-decreasing (so can have duplicates)

    nums1 is sized to fit both arrays, the first m elems are valid and the last n are 0
    nums2 just has valid nums

    [1, 2, 3, 4, 5, 6, 7]
    [2, 4, 7]

    [1, 2, 3, 4, 5, 6, 7]


    [1, 3, 3, 5, 0, 0]
    [3, 6]

    [1, 3, 3, 3, 5, 6]

    approach
    - fill backwards ... we can fill backwards which ensures we don't overwrite anything until we need it
        this is because i < k always

    */

    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var i = m - 1, j = n - 1, k = nums1.count - 1

        while i >= 0 && j >= 0 {
            if nums1[i] >= nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }

            k -= 1
        }

        // handle when one array is done 

        while i >= 0 {
            nums1[k] = nums1[i]
            i -= 1
            k -= 1
        }

        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }

    }
}
