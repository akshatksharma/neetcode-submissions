class Solution {
    func countSubstrings(_ s: String) -> Int {
        var s = Array(s)
        var ans = 0

        /*
            a
            bb
            zabay
            zabbay
            zabbbay

            bbbbb

        */

        for i in 0..<s.count { // start positions for expansion
            ans += palindromeCount(s, i, i)
            ans += palindromeCount(s, i, i + 1)
        }

        return ans
    }

    func palindromeCount(_ s: [Character], _ l: Int, _ r: Int) -> Int {
        var ans = 0
        var L = l
        var R = r

        while L >= 0 && R < s.count {
            if s[L] == s[R] {
                ans += 1
                L -= 1
                R += 1
            } else {
                return ans
            }
        }

        return ans
    }


}
