class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxOnes = 0
        var currOnes = 0

        for num in nums {
            if num == 1 {
                currOnes += 1
            } else if num == 0 {
                maxOnes = max(currOnes, maxOnes)
                currOnes = 0
            }
        }

        maxOnes = max(currOnes, maxOnes)

        return maxOnes
    }
}
