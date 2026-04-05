class Solution {

    /*
    breakdown
    - s2 needs to have a permutation of s1 -> true, else false
        permutation: needs to have the same chars consectuively, but can be in different order

    edge cases
    - s1/s2 be empty?
    - repeat chars?
    - case sensitivity

    implementation
        we need to scan the string until we find one of the chars, 
        from then every consecutive char needs to be in that other string, until we've seen all the chars

        we can do that check in O(1) time if we put the chars in a hashmap. 
            mapping char to count, since a char can come more than once
            this comes at the cost of O(m) where m is the # of unique chars in s2

        once we have our map, we can start walking through the string

        cba lmnccaop 

            # chars = 3
            c: 0
            b: 1
            a: 1

            grow the window as long as we keep matching chars, decrement from our map
            when we stop, we look at our map to see if we've matched everything

            time: O(m + n) where m and n are the lengths of s1 and and s2
            space: O(m)

        cba lmncbopbca
    */

    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)

        var s1Map = [Character: Int]()
        s1.forEach {
            s1Map[$0, default: 0] += 1
        }

        var s2Map = [Character: Int]()
        var L = 0
        for R in 0..<s2.count {
            s2Map[s2[R], default: 0] += 1

            let windowSize = R - L + 1
            if windowSize > s1.count {
                s2Map[s2[L], default: 0] -= 1
                if s2Map[s2[L]] == 0 {
                    s2Map.removeValue(forKey: s2[L])
                }
                L += 1
            } 

            if s2Map == s1Map {
                return true
            }
        }
        
        return false
    }
}
