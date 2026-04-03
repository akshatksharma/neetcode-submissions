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


    AABBB_BCCAAAA

    implementation
    - start from start of array
        - for each char, add to frequency map and track most frequent
        - if char that's not the most frequent shows up, start counting Ks
        - once ks complete, move to next position


        
    */

    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var maxSubstrLength = 0

        var freqMap = [Character: Int]()
        var currentMaxFreq = 0
        var L = 0
        for R in 0..<chars.count {
            freqMap[chars[R], default: 0] += 1

            if let freq = freqMap[chars[R]] {
                currentMaxFreq = max(currentMaxFreq, freq)
            }
 
            while (R - L + 1) - currentMaxFreq > k {
                freqMap[chars[L], default: 0] -= 1
                L += 1
            }

            maxSubstrLength = max(maxSubstrLength, R - L + 1)
        }

        return maxSubstrLength
    }
}
