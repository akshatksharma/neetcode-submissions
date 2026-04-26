class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }

        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2

        for i in 3...n {
            dp[i] = dp[i-2] + dp[i-1]
        }

        return dp[n]
    }

    /*
            5
        4         3
              2      1
            1   0   0
            0

                5
                    3
                        2
                            1
                                0
                            0
                        1
                            0
                    4
                        ...

        F(n) = F(n-2) + F(n-1)


    */
}
