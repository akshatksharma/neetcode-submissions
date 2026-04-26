class Solution {

    /*
        [2, 5, 7, 8] -> 15

                        15
                15              13
           15                             8

        8                            8

                                        0
    */

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var memo: [Int?] = Array(repeating: nil, count: amount + 1)

        func recurse(_ coins: [Int], _ amount: Int) -> Int {
            // base cases
            if amount == 0 {
                return 0
            }

            if let memoAns = memo[amount] {
                return memoAns
            }

            var ans = Int(1e9)
            for coin in coins {
                if amount - coin >= 0 {
                    // pick
                    ans = min(ans, 1 + recurse(coins, amount - coin))
                }
                // don't pick
            }

            memo[amount] = ans

            return ans
        }

        let ans = recurse(coins, amount)

        if ans >= Int(1e9) {
            return -1
        } else {
            return ans
        }
    }


    /*
    coins = int values, amount = target amount of money

    return min coins needed to make exact amount

    can reuse coins 

    picking options while minimizing leans me towards backtracking and/or dp ..

        brute force: backtracking all combinations
            for a given coin, we can include it or not include it 
            2 paths for every n, so this is something like O(2^n) time, and O(2^n) callstack space

        [2, 5, 7, 8] -> 15

                        15
                15              13
           15                             8

        8                            8

                                        0

        the work for 8 overlaps ...

        for a given target and index, F(index, target) gives us the # of coins to get to target
            depends on picking or not picking
            we can only pick if we target - coins[i] is not below 0 ... x is 0 in that case

            F(i, target) = min(F(i+1, target), x * F(i+1, target - coints[i]))

        base cases ... 
            if target == 0 -> 1 way to make that amount 
            if index >= coins.count -> -1 (no way to make that amount) // might need to tweak this
    */
}
