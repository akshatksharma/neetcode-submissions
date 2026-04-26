class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 } // when 1 indexing always look out for this

        var dp = Array(repeating: Int(1e9), count: amount + 1) // 0 -> amount
        dp[0] = 0 // for amount = 0, you need 0 coins

        for currAmount in 1...amount {
            for coin in coins {
                let remainingAmount = currAmount - coin
                if remainingAmount >= 0 {
                    dp[currAmount] = min(dp[currAmount], 1 + dp[remainingAmount])
                }
            }
        }

        return dp[amount] == Int(1e9) ? -1 : dp[amount]
    }
}