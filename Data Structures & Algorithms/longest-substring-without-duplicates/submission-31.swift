class Solution {
    /*
        have a hashmap for counts in current substring
        have a global count we update
        slide on the string
            for each R, we add it to the hashmap
            if the char is alr in our hashmap with a count > 1
                then our array is invalid and we need to advance L
                until it is valid
            then track size and compare to max size
            L
               R
            abcd
            
               L
                  R
            abccabde         {a: 1, b: 1, c: 1, d: 1, e: 1 }

            ccc

            a

            ""
    */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var s = Array(s)
        var substringFreqMap = [Character: Int]()
        var longestSubstringCount = 0

        var L = 0
        for R in 0..<s.count {
            // add to window
            substringFreqMap[s[R], default: 0] += 1

            // make valid if needed
            while let freq = substringFreqMap[s[R]], freq > 1 {
                substringFreqMap[s[L]]! -= 1  // make more swifty if time
                L += 1
            }

            // track max
            longestSubstringCount = max(longestSubstringCount, R - L + 1)
        }

        return longestSubstringCount
    }

    /*
        string s, find longest substring w/o duplicates

        qs
        - s can have any characters? are duplicates case sensitive?
        - size of s 

        brute force: O(n^3)
            generate every substring (n^2) and for each, check if any repeated characters O(n)

        optimized
            abccabcd
            a -> valid
            ab -> valid
            abc -> valid
            abcc -> invalid

        for each substring we're checking all the chars
        for adjacent substrings, the counts are almost the same sans one character
        so if we had an efficient way to track counts, we could easily add the count of the char and check
            we do ... hashmap

        this is leading me towards a sliding window approach
            1. we're looking for substrings
            2. lots of shared work across substrings that we can update efficiently
            3. monotonic .. when we add / remove a char it's clear 
                with that change if we're making it invalid or not

        approach
            have a hashmap for counts in current substring
            have a global count we update
            slide on the string
                for each R, we add it to the hashmap
                if the char is alr in our hashmap with a count > 1
                    then our array is invalid and we need to advance L
                    until it is valid
                then track size and compare to max size

            time: O(n)
            space: O(n) for hashmap


    */
}
