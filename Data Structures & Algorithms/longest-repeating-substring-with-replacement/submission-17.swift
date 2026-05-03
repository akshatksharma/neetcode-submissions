class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        var charFreq = [Character: Int]()
        var maxFreq = 0
        
        var maxLen = 0

        // AAABCCCC

        var L = 0
        for R in 0..<s.count {
            // add to substring
            charFreq[s[R], default: 0] += 1
            maxFreq = max(maxFreq, charFreq[s[R]]!)

            // make it valid (if needed)
            while (R-L+1) - maxFreq > k {
                charFreq[s[L], default: 0] -= 1
                L += 1
            }

            // do work on valid substring
            maxLen = max(maxLen, R-L+1)
        }

        return maxLen
    }
}
