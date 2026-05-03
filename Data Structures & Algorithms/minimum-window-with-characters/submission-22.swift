class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var minWindowSize = s.count
        var minWindowBounds = (0, 0)

        let s = Array(s)
        let t = Array(t)

        // initializing freq maps
        var tFreq = [Character: Int]()
        var substringFreq = [Character: Int]()
        for char in t {
            tFreq[char, default: 0] += 1
            substringFreq[char] = 0
        }
        var numValidChars = 0
        
        var L = 0
        var R = 0

        while R < s.count {
            if let currentCount = substringFreq[s[R]] {
                substringFreq[s[R]] = currentCount + 1

                if substringFreq[s[R]] == tFreq[s[R]] {
                    numValidChars += 1
                }
            }

            while numValidChars == tFreq.keys.count { // once we have the right num of chars, we can check our substring length
                if R - L + 1 <= minWindowSize {
                    minWindowSize = R - L + 1 
                    minWindowBounds = (L, R+1)
                }

                if let currentCount = substringFreq[s[L]] {
                    substringFreq[s[L]] = currentCount - 1

                    if let substringCount = substringFreq[s[L]], 
                       let tCount = tFreq[s[L]],
                       substringCount < tCount {
                        numValidChars -= 1
                    }
                }

                L += 1
            }

            R += 1
        }

        let (minL, minR) = minWindowBounds
        return String(s[minL..<minR])
    }

    /*
        t = ABC
        s = DEAFFBCFOBCA

        brute force: try every substring of s that is at least t.count chars
            see if it has all chars in t using a hashmap of the substring chars
            time: O(n^2 * m) ... n is size of s, m is size of t
            space: O(n) to create hashmap to check substring 

        sliding window: 
            start at L = 0 and R = 0
            have a hashmap of frequency of chars in T (freqT)
            have a hashmap of frequency of T chars in substring (freqSubstring)
            have count of how many valid nums in our soln: numValidChars

            while R within bounds
                if s[R] in freqT
                    freqSubstring[s[R]] += 1
                    if freqSubstring[s[R]] == freqT[s[R]]
                        numValidChars += 1
                
                while numValidChars == t.count
                    // valid soln so compare count (R - L + 1) w/ min
                    if s[L] in freqT
                        freqSubstring[s[L]] -= 1
                        if freqSubstring[s[L]] == freqT[s[L]]
                            numValidChars -= 1
                    L += 1

                R += 1


    */  
}