class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(repeating: 0, count: s.count + 1)

        dp[0] = 1 // if you pick 0 elements there's 1 way to pick

        for i in 1...s.count {
            if s[i-1] != "0" { // indexing is i-1
                dp[i] += dp[i - 1]
            } 
            
            if i >= 2, s[i - 2] != "0" {
                if let digit = Int(String(s[i-2...i-1])), digit >= 10, digit <= 26 {
                    dp[i] += dp[i - 2]
                }
            }
        }

        return dp[s.count]

    }

    /*
        1234
        123 4
        10234

        i = number of ways to decode string that ends at i


                 s[i] != 0   F(i-1)
        F(i) = { +
                 s[i-2...i] >= 10 && <= 26   F(i-2)


        *figure out 0s*
        

    */
}
