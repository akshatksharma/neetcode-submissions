class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count)
        
        // base cases
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2..<cost.count {
            dp[i] = cost[i] + min(dp[i-1], dp[i-2])
        }

        return min(dp[cost.count-1], dp[cost.count-2]) // cost to get off stairs is lesser of 2 last ones
    }
}

/*
    test cases
    - normal

        [1,2,3]

        [1,2,4]
            return min(2,4) ... = 2

    - count = 2

        [1,2]

            [1,2]

                min(1,2) = 1

    - duplicates






    cost[i] == cost of taking step FROM ith floor of staircase

    after paying cost you can go to i+1 or i+2

    return cost of making it to top, i.e cost.count



     0 1 2 3 4  _
    [1,2,3,4,5]

        cost from 0th -> 1
        cost from 1st -> 2
        cost from 2nd -> 3

        brute force: try every combination of stairs ... compare costs

                            0 (1)
                    1 (1+2)             2 (1+3)
                2 (1+2+3)     3 (1+2)       3 (1+3)

                2^N

                F(i) = min cost of stepping to floor i
                    = cost[i] + min(F(i-1), F(i-2))

            O(2^N) time, O(1) space

        dp: we can build up F(i) starting from i = 2 (i=0, i=1 are base cases)
            we can cache answers in an array, so that subsequent i >= 2 can have constant time
            computations

            O(N) time and space

*/
