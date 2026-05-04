class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var numSubarrays = 0
        var prefixSums = Array(repeating: 0, count: nums.count + 1)
        prefixSums[0] = 0

        var prefixSumCounts = [Int: Int]()
        prefixSumCounts[prefixSums[0]] = 1

        for i in 1...nums.count {
            prefixSums[i] = nums[i-1] + prefixSums[i-1]

            if let count = prefixSumCounts[prefixSums[i] - k] {
                numSubarrays += count
            }

             prefixSumCounts[prefixSums[i], default: 0] += 1
        }

        return numSubarrays
    }

    /*
    int array and target size k, need # of subarrays that sum to k
        - ints can be zero / negative
        - can have duplicates
        - k can be positive or negative

        [1, 3, -3, 4, -4] k = 0
            [4, -4]
            [3, -3]
            [3, -3, 4, -4]

        brute force: try every subarray, see if it sums to k .. O(n^2)
            [1]
            [1,3]
            [1,3,-3]
            ...

        sliding window?
            [1, 3, -3, 4, -4]
            its not clear when to add / not add ... might not be possible

        prefix sum of including i elements
             array: [1, 3, -3, 4, -4]
            prefix: [0, 1, 4, 1, 5, 1]
            
            sum of subarray(2, 3) = 3 - 3
                               = prefix(4) - prefix(2)

            sum of subarray(i,j) = prefix(j+1) - prefix(i)
            
            we want how many i and j pairs satisfy this 
                k = prefix(j+1) - prefix(i)
                prefix(i) = prefix(j+1) - k

                so for a i,j if we have a value in our prefix array = prefix(j+1) - k, then
                it sums to k ... we can throw these into a hashmap

                the issue is we have n^2 (i,j) pairs ... so this doesn't help
        
    */
}