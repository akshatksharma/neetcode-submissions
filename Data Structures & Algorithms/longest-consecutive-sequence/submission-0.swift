class Solution {

    /*
    breakdown
    - num int array -> longest consequetive seq
        consecutive seq == diff of only 1
    - sequence does NOT need to be adjacent in original array

    edge cases
    - empty array? -> return 0 
    - 0 / negative numbers? -> yes

    implementation
    - sorting O(nlogn) time, O(1) space
        sort array, go item by item and see how long chain lasts (sliding window)

    - hashmap O(n) time, O(2*n) = O(n) space
        build set of array, then for each item see if item+1 is in the map and build up the count, keep track of max count
        also maintain another set of what nums we've added to a chain already, we don't need to consider those since any chain including a number we've already added
        will be strictly shorter than when it was a part of a chain

        [2, 4, 3, 20] -> [2, 3, 4, 20]
        [2, 4, 3, 20, 22, 21, 23] -> [2, 3, 4, 20, 21, 22, 23]
    */

    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()
        var seenSet = Set<Int>()
        var maxCount = 0

        for num in nums {
            numSet.insert(num)
        }

        for num in nums {
            guard !seenSet.contains(num) else { continue }

            var rollingNum = num
            var currentCount = 0
            while numSet.contains(rollingNum) {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
                seenSet.insert(rollingNum)

                rollingNum += 1
            }
        }

        return maxCount
    }
}
