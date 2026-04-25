class Solution {
    func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var ansL = 0
        var ansR = 0

        /*
        aba
        abba
        a
        aa
        zaba

        */

        for i in 0..<s.count {
            // check palindrome centered at i
            var L = i
            var R = i

            while L >= 0, R < s.count, s[L] == s[R] {
                if R - L + 1 > ansR - ansL + 1 {
                    ansR = R
                    ansL = L
                }

                L -= 1
                R += 1
            }

            // check palindrome centered at i...i+1
            L = i
            R = i + 1

            while L >= 0, R < s.count, s[L] == s[R] {
                if R - L + 1 > ansR - ansL + 1 {
                    ansR = R
                    ansL = L
                }

                L -= 1
                R += 1
            }

        }

        return String(Array(s[ansL...ansR]))
    }


    /*
        brute force: 
            try every substring, see which is a palindrome
            n^2 substrings, and verifying is n time ... O(n^3) complexity

        optimal: 
        the thing is we don't necessarily need to enumerate every substring

            palindromes are centered on either 1 or 2 characters
                a -> palindrome
                bb -> palindrome

                aba -> palindrome centered at a
                abba -> palindrome centered at bb

        so we can go down the chars and for each successive
        single and double letter substring, we can check if things are a palindrome

            we're checking each char at most 2x ... one for the 1 centered case and
            1 for the 2 centered case ... so n substrings and then n to check the palindrome
            so O(n^2) complexity

    */
}
