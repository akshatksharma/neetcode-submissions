class Solution {

    /*
    [3, 4, 5]
        [1, 3, 12]
        [20, 5, 1]
         = [20, 15, 12]



    [2, -3]
    [1, 0, 2]

    */

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ans = Array(repeating: 1, count: nums.count)

        var prefixProduct = 1
        for (idx, num) in nums.enumerated() {
            ans[idx] *= prefixProduct
            prefixProduct *= num
        }

        var postfixProduct = 1
        for (idx, num) in nums.reversed().enumerated() {
            ans[nums.count - 1 - idx] *= postfixProduct
            postfixProduct *= num
        }

        return ans
    }
}
