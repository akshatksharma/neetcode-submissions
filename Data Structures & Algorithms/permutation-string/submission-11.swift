class Solution {
    /*
        s1 = "aabc"        {a: 2, b: 1, c: 1 }
        s2 = "gcbaaf"      {g: 0, c: 1, b: 1, a: 2}      numMatchingChars = 3
        s2 = "abcd"       {a: 1, b: 1, c: 1}            numMatchingChars = 3
        s2 = "gcfba" X    {g: 0, c: 0, f: 1, b: 1, a: 1}            numMatchingChars = 2
        s2 = "gfeabc      {g: 0, f: 0, e: 0, a: 1, b: 1, c: 1}               numMatchingChars = 3

        s1 = "aab"
        s2 = "daba" 

        s1 = "abc"
        s2 = "b"
    */
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2) 
        guard s2.count >= s1.count else { return false }

        var s1FreqMap = [Character: Int]()
        var substringFreqMap = [Character: Int]()

        for char in s1 {
            s1FreqMap[char, default: 0] += 1
        }

        // build window of size s1
        for i in 0..<s1.count {
            substringFreqMap[s2[i], default: 0] += 1
        }

        if substringFreqMap == s1FreqMap { // constant time since keys are just chars
            return true
        }

        // slide over the rest
        var L = 0
        for R in s1.count..<s2.count {
            // remove
            if let substringFreq = substringFreqMap[s2[L]] {
                let newFreq = substringFreq - 1
                substringFreqMap[s2[L]] = newFreq
                if newFreq == 0 {
                    substringFreqMap.removeValue(forKey: s2[L])
                }
                L += 1
            }

            // add
            substringFreqMap[s2[R], default: 0] += 1

            // check
            if substringFreqMap == s1FreqMap {
                return true
            }
        }

        return false
    }

    /*
        s1 = "abc"
        s2 = "gcbaf"
        s2 = "abcd"

        s1 = "aab"
        s2 = "daba" 

        s1 = "abc"
        s2 = "gcfba" X

        s1 = "abc"
        s2 = "gcfba" X

        s1 = "abc"
        s2 = "b"

        s1 s2, return if s2 is a permutation within s1
            s1 has a permutation of s2 if it has a subarray with the
            same counts as s2

        qs
        - s1 and s2 can have any chars? numbers too? -> just lowercase 
            duplicates fine too
        - size -> both at least 1 ... can s2 be smaller than s1? -> yes

        brute force: O(n^3) .. n is size of s2 and m is size of s1
            for each substring (n^2), need to check all chars to see if it contains
            permutation (n)

        optimized:
            s1 = "abc"
            s2 = "gcbaf"

            g X
            gc X
            gcb X
            gcba 

            sliding window stands out because
                1. we're working with substrings / subarrays
                2. there's a lot of overlapping state when it comes to this problem
                3. monotonic ... we can add / remove chars to go towards the problem

            we can slide a window of size s1.count over s2
                check if the counts in the substring match s1
                    we can increment a var like numMatchingChars instead each time we match
                    if numMatchingChars == s1.count, return true
            if nothing tripped true, we return false at the end

            time: O(N) since we're sliding a window and doing constant work
            space: O(N) since the map could have all chars (s2.count could equal s1)



    */
}