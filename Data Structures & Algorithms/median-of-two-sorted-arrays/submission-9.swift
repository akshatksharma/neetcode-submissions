class Solution {

    /* 
        []

        [1] []

        [1, 2, 3] []


              |       |
        [1, 3]  [2, 4, 5]
        [1, 2, 3, 4, 5] n = 5

        [1, 3, 4]  [5, 6, 7]
        [1, 3, 4, 5, 6, 7] n = 6

        count to (n_1 + n_2 + 1) / 2
    */

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0
        var j = 0
        var count = 0

        var medianNum1 = 0
        var medianNum2 = 0

        let maxNeeded = ((nums1.count + nums2.count) / 2) + 1

        while count < maxNeeded  {
            medianNum2 = medianNum1

            if i < nums1.count && j < nums2.count {
                if nums1[i] < nums2[j] {
                    medianNum1 = nums1[i]
                    i += 1
                } else {
                    medianNum1 = nums2[j]
                    j += 1
                }
            } else if i < nums1.count {
                medianNum1 = nums1[i]
                i += 1
            } else if j < nums2.count {
                medianNum1 = nums2[j]
                j += 1
            }

            count += 1
        }

        if (nums1.count + nums2.count) % 2 == 0 {
            return (Double(medianNum1) + Double(medianNum2)) / 2
        } else {
            return Double(medianNum1)
        }
    }
}
