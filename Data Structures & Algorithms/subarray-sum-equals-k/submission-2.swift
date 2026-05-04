class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var numSubarrays = 0
        var sum = 0

        var prefixSumCounts = [Int: Int]()
        prefixSumCounts[sum] = 1

        for i in 1...nums.count {
            sum += nums[i-1]

            if let count = prefixSumCounts[sum - k] {
                numSubarrays += count
            }

             prefixSumCounts[sum, default: 0] += 1
        }

        return numSubarrays
    }
}
