class Solution {

    /*
    breakdown
    - longest string without duplicates
    - can't sort since we want substrings
    - duplicates can happen anywhere in the substring

    edge cases
    - string can be empty? -> yes, return 0

    approach
    
    "abcdecfg"
    "ababcdef"

    could have a set of characters in the current substring and check chars off of that
    when we encounter a repeat char, we store the length and build a new string

    pointers i and j mark the bounds of a string, i and j start at the same char
    we have a set for seen chars for the current substring
    we have a running max substring length
    for each j, we check if its in the set
        if not we add it and increase our current length
        if it is, then we compute max length, and start shrinking our window until we pass
    we continue til j reaches the end of the string

    */

    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        guard !chars.isEmpty else { return 0 }

        var i = 0, j = 0
        var charSet = Set<Character>()
        var currentSubstringLength = 0
        var maxSubstringLength = 0

        // dvdf

        while j < chars.count {
            let char = chars[j]

            if charSet.contains(char) {
                while i < j, charSet.contains(char) {
                    charSet.remove(chars[i])
                    currentSubstringLength -= 1
                    i += 1
                }
            } else {
                charSet.insert(char)
                currentSubstringLength += 1
                maxSubstringLength = max(maxSubstringLength, currentSubstringLength)
                j += 1
            }
        }

        maxSubstringLength = max(maxSubstringLength, currentSubstringLength)

        return maxSubstringLength
    }
}
