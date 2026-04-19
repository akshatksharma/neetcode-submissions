class Solution {

    /*

    we want to split both arrays into L and R partitions that sum up to ceil((M + N) / 2))
    the ends of the L partitions of both arrays should be less than the starts of the R partitions
        this is so that we can be sure that the largest of the L partitions is the median (at least for the odd case)
    
    there's lots of ways we can partition, so lets binary search the value

    odd
    [1, 3, 4] [2, 5, 6, 7]

    [1, 3, 4]
    [2]

    [1, 3, 4|] [2|, 5, 6, 7]

    [1, 3, 4]
    [2]


    even
    [1, 4] [2, 3]

    [1] [4]
    [2] [3]

    [1, 2, 3, 4] -> 2.5
    */

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var numsA: [Int]
        var numsB: [Int]

        // numsA will always be less size than numsB
        if nums1.count < nums2.count {
            numsA = nums1
            numsB = nums2
        } else {
            numsA = nums2
            numsB = nums1
        }

        let totalValsNeeded = (numsA.count + numsB.count + 1) / 2
        var lo = 0
        var hi = numsA.count

        while lo < hi {
            let mid = (lo + hi) / 2

            if !isValidPartition(numsA, numsB, mid) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        // now, lo will be the # of values we need to pick from numsB, the larger array

        // odd
        if (numsA.count + numsB.count) % 2 == 1 {
            // we have a selection from A and B, so we compare them

            let numASelection: Int = {
                guard lo > 0 else { return Int.min }
                return numsA[lo - 1] // lo is the # of items we pick from A
            }()

            let numBSelection: Int = {
                let bIndex = (totalValsNeeded - lo) - 1
                guard bIndex >= 0, bIndex < numsB.count else { return Int.min }
                return numsB[bIndex] // totalValsNeeded - lo is the # of items we pick from B
            }()

            return max(Double(numASelection), Double(numBSelection))


        } else {
            // even

            let numALeftSelection: Int = {
                guard lo > 0 else { return Int.min }
                return numsA[lo - 1] // lo is the # of items we pick from A
            }()

            let numBLeftSelection: Int = {
                let bIndex = (totalValsNeeded - lo) - 1
                guard bIndex >= 0, bIndex < numsB.count else { return Int.min }
                return numsB[bIndex] // totalValsNeeded - lo is the # of items we pick from B
            }()

            let leftSelection = max(numALeftSelection, numBLeftSelection)

            let numARightSelection: Int = {
                guard lo < numsA.count else { return Int.max }
                return numsA[lo] 
            }()

            let numBRightSelection: Int = {
                let bIndex = totalValsNeeded - lo
                guard bIndex >= 0, bIndex < numsB.count else { return Int.max }
                return numsB[bIndex] 
            }()

            let rightSelection = min(numARightSelection, numBRightSelection)

            return (Double(leftSelection) + Double(rightSelection)) / 2
        }
    }

    /*
    [1, 3, 4] [2, 5, 6, 7]

    [1, 3, 4]
    [2]

    */

    func isValidPartition(_ numsA: [Int], _ numsB: [Int], _ n: Int) -> Bool {
        let totalValsNeeded = (numsA.count + numsB.count + 1) / 2

        let numALeftSelection: Int = {
            guard n > 0 else { return Int.min }
            return numsA[n - 1]
        }()

        let numBLeftSelection: Int = {
            let bIndex = (totalValsNeeded - n) - 1
            guard bIndex >= 0, bIndex < numsB.count else { return Int.min }
            return numsB[bIndex]
        }()

        let maxLeft = max(numALeftSelection, numBLeftSelection)

        let numARightSelection: Int = {
            guard n < numsA.count else { return Int.max }
            return numsA[n]
        }()

        let numBRightSelection: Int = {
            let bIndex = totalValsNeeded - n
            guard bIndex >= 0, bIndex < numsB.count else { return Int.max }
            return numsB[bIndex]
        }()

        let minRight = min(numARightSelection, numBRightSelection)

        return maxLeft < minRight
    }
}
