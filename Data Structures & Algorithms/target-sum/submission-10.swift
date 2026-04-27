class Solution {

    private func key(_ idx: Int, _ target: Int) -> String {
        "\(idx)_\(target)"
    }

    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        // var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: target + 1), count: nums.count + 1)
        var memo = [String: Int]()

        func recurse(_ i: Int, _ target: Int) -> Int {
            // base case
            if i >= nums.count {
                if target == 0 {
                    return 1
                } else {
                    return 0
                }
            }

            if let cachedVal = memo[key(i, target)] {
                return cachedVal
            }

            // main case
            let pickedAsPositive = recurse(i+1, target-nums[i])
            let pickedAsNegative = recurse(i+1, target+nums[i])

            memo[key(i, target)] = pickedAsPositive + pickedAsNegative

            return pickedAsPositive + pickedAsNegative
        }

        return recurse(0, target)
    }

    /*
        [1, 1, 1] target = 1

            _ _ _

            F(i) = # of ways to sum to target with an array ending at i
                F(i, target) = F(i-1, target - nums[i]) + F(i-1, target - (-nums[i]))
                i = 0 -> 0
                i = nums.count-1, target = 0 -> 1
                i = nums.count-1, target != 0 -> 0

            -1 +1 +1
            +1 -1 +1
            +1 +1 -1

            [+1, -1, +1, -1]

    */
}
