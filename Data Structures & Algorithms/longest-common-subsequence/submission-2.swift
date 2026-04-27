class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1)
        var text2 = Array(text2)
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: text2.count), count: text1.count)
        /*
            crabt
            cat
        */

        func recurse(_ i: Int, _ j: Int) -> Int {
            // base cases
            if i >= text1.count || j >= text2.count {
                return 0
            }

            if let cachedVal = memo[i][j] {
                return cachedVal
            }

            if text1[i] == text2[j] {
                let ans = 1 + recurse(i+1, j+1)
                memo[i][j] = ans
                return ans
            } else {
                let ans = max(recurse(i+1, j), recurse(i, j+1))
                memo[i][j] = ans
                return ans
            }
        }

        return recurse(0, 0)
    }


    /*
        crabt
        cat
            
        F(i, j): longest subsequence starting at i and j (i indexes text1 and j indexes text2) 

            F(i, j)
                - text1[i] == text2[j] -> 1 + F(i+1, j+1)
                - text1[i] != text2[j] -> max(F(i, j+1), F(i+1, j))
                - i > text1.count || j > text2.count -> 0

            at most 2 branching at once, O(2^(n+m)) time and space where n is text1.count and m is text2.count

            we can memoize unique i and j combinations, so this would reduce the time to O(n*m)
            time and space

    */
}
