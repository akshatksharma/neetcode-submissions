class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = [1, 2] // at the start this is the ans for n = 1 and n = 2

        guard n > 2 else { return dp[n - 1] }

        var i = 3 
        while i <= n {
            let tmp = dp[1]
            dp[1] = dp[0] + dp[1]
            dp[0] = tmp
            i += 1
        }

        return dp[1]
    }

    /*
        n = 4

        [1, 2]
        [2, 3]


    */

    /*

        at a given level n, the # of ways to go up is just the sum of the # of ways to go up n-2 and n-1
        we know at the base there's 1 way to go up when n = 1, 2 ways to go up when n = 2

        we can build up to any n from summing n-2 and n-1 starting from 1 and 2

        1
            1

        2
            1
            2

        3
            1 1 1
            1 2
            2 1

            [2, 3]

            n = 4


        
        5
            4
                3 
                        2 -> 2

                        1 -> 1

                2

            3

                2

                1

    */
}
