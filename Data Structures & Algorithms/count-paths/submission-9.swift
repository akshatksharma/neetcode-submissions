class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        dp[m-1][n-1] = 1 // corner is 1

        for i in stride(from: m-1, through: 0, by: -1) {
            for j in stride(from: n-1, through: 0, by: -1) {
                dp[i][j] += dp[i+1][j] + dp[i][j+1]
            }
        }

        return dp[0][0]
    }


    /*
    i indexes rows (0..<m)
    j indexs columns (0..<n)

    F(i,j) gives the number of paths to the bottom corner

    F(i,j) = F(i+1,j) + F(i,j+1)
        F(m-1,n-1) = 1
        F(i,n) = 0
        F(m, j) = 0

    we can build a dp table of size m x n and work out way backwards to i = 0 and j = 0
        time: O(n*m)
        space: O(n*m)

    */
}
