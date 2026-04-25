class Solution {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var ans = 0
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

        for i in 0..<dp.count {
            dp[i][i] = true // ranges of size 1 have 1 palindrome in them
            
            if dp[i][i] {
                ans += 1
            }
        }

        for i in 0..<dp.count - 1 {
            dp[i][i+1] = s[i+1] == s[i] // ranges of size 2 are palindromes 
            
            if dp[i][i+1] {
                ans += 1
            }
        }

        guard s.count >= 3 else { return ans }

        for size in 3...s.count {
            for i in 0...(s.count - size) {
                let j = (i + size) - 1

                dp[i][j] = s[i] == s[j] && dp[i+1][j-1]

                if dp[i][j] {
                    ans += 1
                }
            }
        }

        return ans
    }   

    /*
    racecar

        return # of palindromes

            palindrome 
                size 1 string -> yes "a"
                size 2 string -> yes if they're the same "bb"
                size 3 string 
                    "aba"
                        yes if strings at L and R are equal + string from L+1 to R-1 is palindrome
                
                so need to solve smaller problems first

                abba
                    a
                    b
                    b
                    a
                        ab
                        bb
                        ba
                            abb
                            bba
                                abba

                aaa
                    a
                    a
                    a
                        aa
                        aa
                            aaa

    */
}
