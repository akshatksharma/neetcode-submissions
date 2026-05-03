class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }

        let s = Array(s)
        var charMap = [Character: Int]()

        var L = 0
        var maxLength = 0

        for R in 0..<s.count  {
            charMap[s[R], default: 0] += 1 // add to substring

            while let charCount = charMap[s[R]], charCount > 1, L < R { // make substring valid
                charMap[s[L]]! -= 1
                L += 1
            }

            maxLength = max(maxLength, R - L + 1) // do stuff on valid substring
        }

        return maxLength
    }

    /*
    brute force: build up and check substring ... O(n^2)

    or we can build substrings starting from one end
    when we add chars to substring, we add to a map
    if we see a duplicate, we start to remove chars from substring and the map until that duplicate is gone
    then we continue growing substring

    this'll let us go through all the substrings and share the info about counts between them
    */
}
