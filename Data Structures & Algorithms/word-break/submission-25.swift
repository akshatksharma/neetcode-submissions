class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        var dp: [Bool] = Array(repeating: false, count: s.count+1)
        dp[s.count] = true

        for i in stride(from: s.count-1, through: 0, by: -1) {
            for word in wordDict {
                if i+word.count <= s.count, word == String(s[i..<i+word.count]) {
                    dp[i] = dp[i+word.count]

                    if dp[i] {
                        break
                    }
                }
            }
        }

        return dp[0]
    }

    /*
        size = 8

        leetcode

        leet,code

        O(n*m) n is size of string and m is the size of the dictionary

        F(i) = F(i + s.count)


    */
}
