class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }

        var s = Array(s)
        var charSet = Set<Character>()

        var L = 0
        var R = 0
        
        var maxLength = 0

        while R < s.count {
            if !charSet.contains(s[R]) {
                charSet.insert(s[R])
                R += 1
            } else {
                while charSet.contains(s[R]), L < R {
                    charSet.remove(s[L])
                    L += 1
                }
            }

            maxLength = max(maxLength, R - L)
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
