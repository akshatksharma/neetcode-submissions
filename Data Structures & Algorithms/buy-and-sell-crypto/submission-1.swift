class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        /*
            return max profit means we should be trying all of the combinations

            N^2 ... try buying each and seeing wnen to sell, track max sell amt

            we can likely see optimize by tracking these items in one pass
            - min buy date
            - max sell date
            - buy needs to be before sell (not same day)
        */ 

        guard prices.count > 1 else { return 0 }

        var maxProfit = 0
        var lo = 0
        var hi = 1

        while hi < prices.count {
            let profit = prices[hi] - prices[lo]

            if profit > 0 {
                maxProfit = max(maxProfit, profit)
            } else {
                lo = hi
            }

            hi += 1
        }

        return maxProfit
    }
}
