class Solution {
    // 10 1 3 15
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        guard prices.count > 1 else { return maxProfit }

        var L = 0
        var R = 1

        while R < prices.count {
            let buyPrice = prices[L]
            let sellPrice = prices[R]

            if sellPrice > buyPrice {
                maxProfit = max(maxProfit, sellPrice - buyPrice)
            } else {
                L = R
            }

            R += 1
        }

        return maxProfit
    }
}
