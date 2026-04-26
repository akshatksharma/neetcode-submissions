class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }

        var dp = [1, 2] // idx 0 = i-2. idx 1 = i-1

        for i in 3...n {
            let tmp = dp[1]
            dp[1] = dp[0] + dp[1]
            dp[0] = tmp
        }

        return dp[1]
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
