class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }

        var s1 = Array(s1)
        var s2 = Array(s2)
        var s3 = Array(s3)

        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
        dp[s1.count][s2.count] = true

        for i in stride(from: s1.count, through: 0, by: -1) {
            for j in stride(from: s2.count, through: 0, by: -1) {
                if i == s1.count && j == s2.count { continue } // don't overwrite basecase

                let k = i + j

                if i < s1.count, s1[i] == s3[k] {
                    dp[i][j] = dp[i+1][j]
                }

                if j < s2.count, s2[j] == s3[k] {
                    dp[i][j] = dp[i][j] || dp[i][j+1] // || to preserve above value
                }

            }
        }

        return dp[0][0]
    }
}


        /*
            s1  s2
            a   b     

            s3
            ab

                s2
                b _
                0 1
         a   0  T F   
         _   1  T T   


            s1  s2
            ab  ab     

            s3
            abba

                s2
                0 1 2
       s1   0       
            1         
            2       T

        */

