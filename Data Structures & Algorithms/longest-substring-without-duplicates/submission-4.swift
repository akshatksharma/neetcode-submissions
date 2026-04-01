class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)

        var l = 0
        var charSet = Set<Character>()
        var currentSubstringLength = 0, maxSubstringLength = 0

        // dvadf

        for r in 0..<chars.count {
            while charSet.contains(chars[r]) {
                charSet.remove(chars[l])
                currentSubstringLength -= 1
                l += 1
            }

            charSet.insert(chars[r])
            currentSubstringLength += 1
            maxSubstringLength = max(maxSubstringLength, currentSubstringLength)
        }

        return maxSubstringLength
    }
}
