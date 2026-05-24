class Solution {
    func countSubstrings(_ s: String) -> Int {
        var s = Array(s)
        var numSubstrings = 0
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

        // need to build up from substrings of size 0 -> size n

        /*
            aba

            a
            b
            a
            aba


            abba

        */

        for palindromeLen in 0..<s.count {
            for i in 0..<s.count-palindromeLen {
                let j = i + palindromeLen

                if i == j {
                    dp[i][j] = true
                    numSubstrings += 1
                } else if j == i + 1, j < s.count, s[i] == s[j] {
                    dp[i][j] = true
                    numSubstrings += 1
                } else if s[i] == s[j], dp[i+1][j-1] {
                    dp[i][j] = true
                    numSubstrings += 1
                }
            }
        }

        return numSubstrings
    }
}
