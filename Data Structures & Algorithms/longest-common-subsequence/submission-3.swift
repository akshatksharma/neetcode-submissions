class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        let m = text1.count
        let n = text2.count

        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in stride(from: m-1, through: 0, by: -1) {
            for j in stride(from: n-1, through: 0, by: -1) {
                if text1[i] == text2[j] {
                    dp[i][j] = 1 + dp[i+1][j+1]
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j+1])
                }
            }
        }

        return dp[0][0]
    }

    /*
        0 1 2 3 4
        A B C D E
        A C E

            0 1 2 3 4 5
        0     1+      0
        1             0
        2         1  1 0
        3  0          0

        brute force: 2^(m+n) where m is len of text1 and n is len of text2

        F(i, j): length of the longest common subseq starting at i and j (i indexes text1, j indexes text2)

                        text1[i] == text2[j] -> 1 + F(i + 1, j + 1)
            F(i, j) = { 
                        text1[i] != text2[j] -> max(F(i, j + 1), F(i + 1, j))

                        i > text1.count || j > text2.count -> 0
    */
}