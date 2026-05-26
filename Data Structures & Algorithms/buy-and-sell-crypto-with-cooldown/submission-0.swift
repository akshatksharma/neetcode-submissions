class Solution {
    struct MemoVal: Hashable {
        let idx: Int
        let canBuy: Bool
    }

    func maxProfit(_ prices: [Int]) -> Int {
        var memo = [MemoVal: Int]() // profit at a given idx, canBuy state

        func dfs(_ idx: Int, _ canBuy: Bool) -> Int {
            // base cases
            if idx >= prices.count { 
                return 0 
            }

            if let memoProfit = memo[MemoVal(idx: idx, canBuy: canBuy)] {
                return memoProfit
            }

            // recursive states
            if canBuy {
                let doNothing = dfs(idx+1, canBuy)
                let buy = dfs(idx+1, false) - prices[idx]
                let maxProfit = max(doNothing, buy)
                memo[MemoVal(idx: idx, canBuy: canBuy)] = maxProfit
            } else {
                let doNothing = dfs(idx+1, canBuy)
                let sell = dfs(idx+2, true) + prices[idx]
                let maxProfit = max(doNothing, sell)
                memo[MemoVal(idx: idx, canBuy: canBuy)] = maxProfit
            }

            return memo[MemoVal(idx: idx, canBuy: canBuy)]!
        }

        return dfs(0, true) // can always buy at the start
    }
}

/*
                      _
    (buy)        /       \  (do nothing)
               -1 
     sell    /     \ dn
           1
           | dn
           1
   buy  /     \ dn
      4


                    state = idx we're on, and whether we are buying or selling 
                        (we can always do nothing, so don't need to model that)

                                                F(i+1, canBuy) // do nothing
        F(i, canBuy) = max ( if canBuy == true  F(i+1, false) - prices[i] // buy at idx i
                             if canBuy == false F(i+2, true) + prices[i] // sell at idx i, go to i + 2 bc we can't do anything after selling
                              
        we can memoize i,canBuy

*/