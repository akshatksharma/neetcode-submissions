class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        var memo: [Bool?] = Array(repeating: nil, count: s.count)

        func recurse(_ i: Int) -> Bool {
            // base case
            if i == s.count {
                return true
            }

            if let memoedVal = memo[i] {
                return memoedVal
            }

            // recurse
            for word in wordDict {
                if i+word.count <= s.count,
                    word == String(s[i..<i+word.count]) {

                    memo[i] = recurse(i+word.count)
                    if memo[i] == true {
                        return true
                    }
                }
            }

            return false
        }

        return recurse(0)
    }

    /*

    it's almost like we have a knapsack of words in dictionary, and our string is our capacity

        we can work backwards from i = s.count-1 and see if the string starting at i can be segmented

            F(i) = F(i + word.count) for word in dictionary if word == s[i+count-1] 

                i == s.count-1 -> true


        brute force would be to try every word at every position ... O(m^n) where m is size of dictionary
        and n is length of s

        we can memoize this and this would be O(m) since we try each item once, and
        then memoize the next tiem
        space also O(m)


    apple|pen|apple




            
    neetcode
    neetcode|
    neetcod|e
    neetco|de
    neetc|ode
    neet|code

    ...
        


    n|e|e|t|c|o|d|e

    ne|et|co|de

    neet|code




    F(i): whether string starting at i can be segmented into dictionary words




    */
}
