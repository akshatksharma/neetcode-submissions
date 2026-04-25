class Solution {
    func countSubstrings(_ s: String) -> Int {
        var s = Array(s)
        var ans = 0
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

        for len in 1...s.count { // length of palindrome
            for i in 0...s.count - len { // starting index from 0 all the way to len
                let j = i + (len - 1)

                if i == j { // 1 char string
                    dp[i][j] = true
                    ans += 1
                } else if j == i + 1 { // 2 char string
                    if s[i] == s[j] {
                        dp[i][j] = true
                        ans += 1
                    }
                } else { // 3+ char string
                    dp[i][j] = s[i] == s[j] && dp[i+1][j-1]

                    if dp[i][j] {
                        ans += 1
                    }
                }
            }
        }

        return ans
    }


    /* 
        abcba
        abba
        a
        aa
        aabcbf


        palindromes at bigger sizes are composed of smaller palindromes
            if we have a string of size n with indicies of some i to n-1,
            we can compare the vals at i and n-1 to see if they're the same
            and then see if the string from i+1 to n-2 is also a palindrome

        we can tabulate an 2d array that indicates whether the string from i to 
        j (inclusive) is a palindrome

            dp[i][j] = s[i] == s[j] && dp[i+1][j-1]

        we have base cases

            if j == i, then dp[i][j] = true always

            if j = i + 1 (i.e size 2 array), 
                dp[i][j] = true if s[i] == s[j]

        from there we can build our other values with the ^ relation ... it just 
        depends on the smaller value, so lets build up small values


        abbc

            a

            b

            b

            c

                ab

                bb

                bc

                    abb
                    
                    bbc




    */
}