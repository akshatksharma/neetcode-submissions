class Solution {
    func rob(_ nums: [Int]) -> Int {
        var dp = [0, nums[0], 0]
        var ans = nums[0]

        for i in 1..<nums.count {
            let num = nums[i]
            let farNeighbor = dp[0]
            let pickingNum = num + farNeighbor

            let pickingNeighbor = dp[1]

            let maxMoney = max(pickingNeighbor, pickingNum)
            dp[2] = maxMoney
            dp[0] = dp[1]
            dp[1] = dp[2]

            ans = max(ans, maxMoney)
        }

        return ans
    }

    /*
        nums[i] is money at house i
        can't rip adjacent houses

        return max amount of money without alerting police

        - nums[i] go from 0 to 100
        - up to 100 houses
        [50, 20, 35, 100, 2]

        [50, 50, 85, 150, 150]


        [50, 20, 35, 35, 2]

        [1, 2, 2, 2, 2]


        what if we walk from the start 
            for each num n there are 2 options
                use the number and add it to the n - 2 number
                or don't use the number and set it to the n - 1 number
                the larger of the 2 is the answer at this point



        <<>>>>>>>>>>>>>>>>>>>>>>>

        since all houses have non zero amount of money, the max # of houses we can hit is (n + 1) / 2

        but sometimes we'd want to skip a house if it means letting us steal from a big house

            50 + 35 + 2 = 87
            50 + 20 + 100 = 170
            

        comparing houses to neighbors
            house bigger than both neighbors
                we prob wanna pick it
            house bigger than one neighbor

            house not bigger than any neighbor
                we never pick it

    */
}
