class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(repeating: 0, count: s.count+1)
        dp[s.count] = 1 // helping with edge case
        dp[s.count - 1] = s[s.count - 1] == "0" ? 0 : 1 // one way to decode the last num (if not 0)

        for i in stride(from: s.count - 2, through: 0, by: -1) {
            var numWays = 0
            // picking 1
            if s[i] != "0" {
                numWays += dp[i+1]
            } 

            // picking 2
            if let num = Int(String(s[i...i+1])), (10...26).contains(num) {
                numWays += dp[i+2]
            }

            dp[i] = numWays
        }

        return dp[0]
    }
}

/*
    approach

        1212

            [5 3 2 1 1]

        3212

            [3 3 2 1 1]


        1012

            [2 0 2 1 1]

        valid decisions
        - pick 1 digit
        - pick 2 digits if 2 digits is 26 or less

        for either, the next number in the sequence can't be 0 ... if it is, then choose the other
        

        for any valid decision, # of ways = 1 + num of valid decisions in rest of number

            F(i) = number of ways to decode string starting at i
                
                        F(i+1) + F(i+2) if nums[i..i+2] is within 10 and 26
                F(i) =  F(i+1) 
                
                F(i) = 1 if i == nums.count - 1
                F(i) = 0 if nums[i] == 0


    examples

                    1212

            1 212     12 12       


                    3212

            3 212     


                    1012

            012       12

                    _


*/