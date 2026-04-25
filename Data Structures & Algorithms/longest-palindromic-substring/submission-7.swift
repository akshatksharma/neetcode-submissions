class Solution {
 func longestPalindrome(_ s: String) -> String {
        let s = Array(s)
        var longestIndicies = (0, 0)

        for i in 0..<s.count {
            let (L1, R1) = palindrome(s, l: i, r: i)
            let (L2, R2) = palindrome(s, l: i, r: i+1)
            let (LMax, RMax) = longestIndicies

            let l1Length = R1 - L1 + 1
            let l2Length = R2 - L2 + 1
            let maxLength = RMax - LMax + 1

            if l1Length > l2Length, l1Length > maxLength {
                longestIndicies = (L1, R1)
            } else if l2Length > maxLength {
                longestIndicies = (L2, R2)
            }

        }

        let (LMax, RMax) = longestIndicies
        return String(s[LMax...RMax])
    }

    func palindrome(_ s: [Character], l: Int, r: Int) -> (Int, Int) {
        var L = l
        var R = r
        var answer = (L, R)

        if L < 0 || R >= s.count || s[L] != s[R] {
            return (0, -1)
        }

        while L >= 0 && R < s.count {
            if s[L] == s[R] {
                answer = (L, R)
                L -= 1
                R += 1
            } else {
                return answer
            }
        }

 
        return answer
    }
}