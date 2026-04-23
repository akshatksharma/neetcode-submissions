class Solution {
 func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var longestIndicies = (0, 0)

        for i in 0..<s.count {
            let (L, R) = palindrome(s, startIndex: i)
            let (LMax, RMax) = longestIndicies
            if (R - L + 1) > (RMax - LMax + 1) {
                longestIndicies = (L, R)
            }
        }

        let (LMax, RMax) = longestIndicies
        return String(s[LMax...RMax])
    }

    func palindrome(_ s: [Character], startIndex i: Int) -> (Int, Int) {
        var L = i
        var R = i
        var answer = (L, R)

        while R+1 < s.count, s[R+1] == s[R] {
            R += 1
        }

        while L-1 >= 0, s[L-1] == s[L] {
            L -= 1
        }

        while L >= 0 && R < s.count && s[L] == s[R] {
            answer = (L, R) // this is the happy area of the loop 
            L -= 1
            R += 1
        }

        return answer
    }
}
