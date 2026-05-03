class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        var charMap = [Character: Int]()
        var largestStringSize = 0

        var mostCommonCharacterCount = 0
        var L = 0
        var R = 0

        while R < s.count {
            charMap[s[R], default: 0] += 1
            mostCommonCharacterCount = max(mostCommonCharacterCount, charMap[s[R]]!)
            if mostCommonCharacterCount >= (R - L + 1) - k {
                largestStringSize = max(largestStringSize, R - L + 1)
            } else {
                while mostCommonCharacterCount < (R - L + 1) - k {
                    charMap[s[L], default: 0] -= 1
                    L += 1
                }
            }

            R += 1
        }

        return largestStringSize
    }

    /* 
    brute force: try every substring, count frequency of chars, see which ones
    (of size n) have it so that the most frequent char occurs at least n-k times
    compare maxes

    sliding window: we can enumerate through substrings by sliding over the string
    ... maintaining the count of the most popular item and seeing if its at least n-k
        if it is, we keep growing string and update our max size
        if not we start shrinking until it is

    return with max size

    */
}
