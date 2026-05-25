class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        dp[m-1][n-1] = 1

        for row in stride(from: m-1, through: 0, by: -1) {
            for col in stride(from: n-1, through: 0, by: -1) {
                dp[row][col] += dp[row+1][col] + dp[row][col+1]
            }
        }

        return dp[0][0]
    }
}


/*
brute force
    try every path with dfs
        so every node, move in all 4 directions
    
        O(4^n) time bc we can't mark visited ... we need all uniqe paths


optimized
    we're counting, so maybe we can have some sort of trick

    start from the bottom right corner ... 1 unique path from there
    at the grids right above and right below, it's 1 as well
    at the diagonal it's 2


        F(i,j): # unique paths to bottom right corner from i,j
            F(i,j) = F(i+1,j) + F(i, j+1)
            F(m-1,n-1) = 1

        we can build this from m-1,n-1

        time: O(m*n)
        space: O(m*n) 

*/