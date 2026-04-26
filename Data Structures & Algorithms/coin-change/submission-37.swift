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
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: amount + 1), count: coins.count)

        func recurse(_ coins: [Int], _ amount: Int, _ i: Int) -> Int {
            // base cases
            if amount == 0 {
                return 0
            }

            if i >= coins.count { 
                return Int(1e9)
            }

            if let memoAns = memo[i][amount] {
                return memoAns
            }

            // not picking
            var answer = recurse(coins, amount, i+1)

            // picking
            if amount - coins[i] >= 0 {
                let pickingSelf = 1 + recurse(coins, amount - coins[i], i)
                answer = min(answer, pickingSelf)
            }

            memo[i][amount] = answer

            return answer
        }

        let ans = recurse(coins, amount, 0)

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
