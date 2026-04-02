class Solution {

    /*
    breakdown
    - need to return longest same substring after replacing up to k chars
    
    AABAEF k = 2 -> AAAAAF = 5

    ABCDEF k = 2 -> AAADEF = 3

    AABCCDDAAAF k = 2
    AABCXAAAF k = 2

    makes sense to augment the current max char (or the first if all the same)
        so need to do a pass to see what chars are the most frequent
    then maybe we start sliding k of those chars around the string and calculating the strings 

    edge cases
    - string can be empty -> no
    - can k be 0 -> yes, in that case return the longest same substring


    AABB_BCCAAAA

    implementation
    - start from start of array
        - for each char, add to frequency map and track most frequent
        - if char that's not the most frequent shows up, start counting Ks
        - once ks complete, move to next position


        
    */

    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var chars = Array(s)
        var freqMap = [Character: Int]()

        var maxSubstrLength = 0

        var currentMaxFreq = 0
        var i = 0
        for j in 0..<chars.count {
            freqMap[chars[j], default: 0] += 1

            if let freq = freqMap[chars[j]] {
                currentMaxFreq = max(currentMaxFreq, freq)
            }

            let substrLength = j - i + 1

            if substrLength - currentMaxFreq > k {
                // we can't replace enough things, so shrink window
                freqMap[chars[i], default: 0] -= 1
                i += 1
            } else {
                // record current length
                maxSubstrLength = max(maxSubstrLength, substrLength)
            }
        }

        return maxSubstrLength
    }
}
