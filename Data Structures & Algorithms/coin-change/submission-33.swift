class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
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