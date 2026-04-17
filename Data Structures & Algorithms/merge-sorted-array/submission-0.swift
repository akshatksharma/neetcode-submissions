class Solution {

    /*
    integers, non-decreasing (so can have duplicates)

    nums1 is sized to fit both arrays, the first m elems are valid and the last n are 0
    nums2 just has valid nums

    [1, 3, 5, 6, 0, 0, 0]

    [1, 3, 5, 6, 0, 0, 0]
    [2, 4, 7]

    [1, 2, 3, 4, 5, 6, 7]


    [1, 3, 3, 5, 0, 0]
    [3, 6]

    [1, 3, 3, 3, 5, 6]

    approach
    - make a copy of the first m elements nums1 and then do a 3 pointer approach
    - O(N+M) time and O(M) extra space


    */

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        let nums1Copy = Array(nums1[0..<m])

        var i = 0, j = 0, k = 0

        while i < nums1Copy.count && j < nums2.count {
            if nums1Copy[i] <= nums2[j] {
                nums1[k] = nums1Copy[i]
                i += 1
            } else {
                nums1[k] = nums2[j]
                j += 1
            }

            k += 1
        }

        while i < nums1Copy.count {
            nums1[k] = nums1Copy[i]
            i += 1
            k += 1
        }

        while j < nums2.count {
            nums1[k] = nums2[j]
            j += 1
            k += 1
        }

    }
}
